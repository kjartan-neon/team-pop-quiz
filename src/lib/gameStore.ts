import { writable } from 'svelte/store';
import { supabase } from './supabase';
import type { GameState, Session, Question } from '../types/quiz';
import { createConfetti } from './confetti';

function createGameStore() {
  const { subscribe, set, update } = writable<GameState>({
    session: null,
    currentQuestion: null,
    isLoading: false,
    gamePhase: 'setup',
    team2HasDoubleOption: false,
    lastAnswer: null,
    showCorrectAnswer: null,
    loadError: null,
    isQuestionFading: false,
    lastCorrectAnswer: null
  });

  return {
    subscribe,
    
    async createSession(wordCombination: string, team1Name: string, team2Name: string) {
      update(state => ({ ...state, isLoading: true }));
      
      try {
        // Sanitize inputs on client side as well
        const sanitizedWordCombination = wordCombination.trim().toLowerCase().slice(0, 50);
        const sanitizedTeam1Name = team1Name.trim().slice(0, 50);
        const sanitizedTeam2Name = team2Name.trim().slice(0, 50);
        
        // Basic validation
        if (sanitizedWordCombination.length < 3) {
          throw new Error('Sesjonsord må være minst 3 tegn langt');
        }
        if (sanitizedTeam1Name.length < 1 || sanitizedTeam2Name.length < 1) {
          throw new Error('Lagnavn må være minst 1 tegn langt');
        }
        
        const { data: session, error } = await supabase
          .from('quiz_sessions')
          .insert({
            word_combination: sanitizedWordCombination,
            team1_name: sanitizedTeam1Name,
            team2_name: sanitizedTeam2Name
          })
          .select()
          .single();

        if (error) throw error;

        update(state => ({
          ...state,
          session,
          gamePhase: 'team1_turn',
          isLoading: false,
          showCorrectAnswer: null,
          loadError: null,
          isQuestionFading: false,
          lastCorrectAnswer: null
        }));

        await this.loadNextQuestion();
      } catch (error) {
        console.error('Error creating session:', error);
        update(state => ({ 
          ...state, 
          isLoading: false,
          loadError: error.message || 'Det oppstod en feil ved opprettelse av sesjonen'
        }));
      }
    },

    async loadSession(wordCombination: string) {
      update(state => ({ ...state, isLoading: true }));
      
      try {
        // Sanitize input
        const sanitizedWordCombination = wordCombination.trim().toLowerCase().slice(0, 50);
        
        if (sanitizedWordCombination.length < 3) {
          update(state => ({
            ...state,
            isLoading: false,
            loadError: 'Sesjonsord må være minst 3 tegn langt'
          }));
          return;
        }
        
        const { data: session, error } = await supabase
          .from('quiz_sessions')
          .select('*')
          .eq('word_combination', sanitizedWordCombination)
          .single();

        if (error) {
          if (error.code === 'PGRST116') {
            // No rows found
            update(state => ({
              ...state,
              isLoading: false,
              loadError: 'Ingen sesjon funnet med dette ordet. Sjekk stavemåten.'
            }));
            return;
          }
          throw error;
        }

        update(state => ({
          ...state,
          session,
          gamePhase: session.current_turn === 1 ? 'team1_turn' : 'team2_turn',
          isLoading: false,
          showCorrectAnswer: null,
          loadError: null,
          isQuestionFading: false,
          lastCorrectAnswer: null
        }));

        await this.loadNextQuestion();
      } catch (error) {
        console.error('Error loading session:', error);
        update(state => ({ 
          ...state, 
          isLoading: false,
          loadError: error.message || 'Det oppstod en feil ved lasting av sesjonen. Prøv igjen.'
        }));
      }
    },

    async loadNextQuestion() {
      try {
        // First get the total count of questions
        const { count, error: countError } = await supabase
          .from('quiz_questions')
          .select('*', { count: 'exact', head: true });

        if (countError) throw countError;
        if (!count || count === 0) return;

        // Generate a random offset to get a truly random question
        const randomOffset = Math.floor(Math.random() * count);
        
        const { data: questions, error } = await supabase
          .from('quiz_questions')
          .select('*')
          .range(randomOffset, randomOffset)
          .limit(1);

        if (error) throw error;

        if (questions && questions.length > 0) {
          const randomQuestion = questions[0];
          
          // Shuffle multiple choice options if it's a multiple choice question
          if (randomQuestion.question_type === 'multiple_choice' && randomQuestion.options) {
            const shuffledOptions = [...randomQuestion.options];
            // Fisher-Yates shuffle algorithm
            for (let i = shuffledOptions.length - 1; i > 0; i--) {
              const j = Math.floor(Math.random() * (i + 1));
              [shuffledOptions[i], shuffledOptions[j]] = [shuffledOptions[j], shuffledOptions[i]];
            }
            randomQuestion.options = shuffledOptions;
          }
          
          update(state => ({
            ...state,
            currentQuestion: randomQuestion,
            lastAnswer: null,
            showCorrectAnswer: null,
            isQuestionFading: false
          }));
        }
      } catch (error) {
        console.error('Error loading question:', error);
      }
    },

    async submitAnswer(answer: string) {
      let currentState: GameState;
      const unsubscribe = subscribe(state => currentState = state);
      unsubscribe();

      if (!currentState!.session || !currentState!.currentQuestion) return;

      const currentTeam = currentState!.gamePhase === 'team1_turn' ? 1 : 2;
      
      // Sanitize answer input
      const sanitizedAnswer = answer.trim().slice(0, 200);
      
      let isCorrect = false;
      let pointsAwarded = 0;

      if (currentState!.currentQuestion.question_type === 'multiple_choice') {
        isCorrect = sanitizedAnswer === currentState!.currentQuestion.correct_answer;
      } else {
        const correctNumber = parseFloat(currentState!.currentQuestion.correct_answer);
        const userNumber = parseFloat(sanitizedAnswer);
        const margin = correctNumber * 0.1;
        isCorrect = Math.abs(userNumber - correctNumber) <= margin;
      }

      if (isCorrect) {
        // Base points based on difficulty
        let basePoints = 25; // easy
        if (currentState!.currentQuestion.difficulty === 'medium') {
          basePoints = 50;
        } else if (currentState!.currentQuestion.difficulty === 'hard') {
          basePoints = 100;
        }
        
        // Double points for team 2 if they have the double option
        pointsAwarded = currentTeam === 2 && currentState!.team2HasDoubleOption ? basePoints * 2 : basePoints;
      } else {
        // Fixed penalty of -10 points for wrong answers
        pointsAwarded = -10;
      }

      const updatedSession = { ...currentState!.session };
      if (currentTeam === 1) {
        updatedSession.team1_score += pointsAwarded;
        // If team 1 got it right or wrong, team 2 gets a turn
        updatedSession.current_turn = isCorrect ? 2 : 2;
      } else {
        updatedSession.team2_score += pointsAwarded;
        // If team 2 got it right, move to team 1. If wrong, team 1 gets to try
        updatedSession.current_turn = isCorrect ? 1 : 1;
      }

      try {
        await supabase
          .from('quiz_sessions')
          .update({
            team1_score: updatedSession.team1_score,
            team2_score: updatedSession.team2_score,
            current_turn: updatedSession.current_turn,
            updated_at: new Date().toISOString()
          })
          .eq('id', currentState!.session.id);

        await supabase
          .from('quiz_game_history')
          .insert({
            session_id: currentState!.session.id,
            question_id: currentState!.currentQuestion.id,
            team_number: currentTeam,
            answer_given: sanitizedAnswer,
            is_correct: isCorrect,
            points_awarded: pointsAwarded
          });

        // Check if both teams answered wrong (team 2 just answered wrong and has double option)
        const shouldShowCorrectAnswer = currentTeam === 2 && !isCorrect && currentState!.team2HasDoubleOption;

        // Store the correct answer for display in scoreboard
        const correctAnswerToStore = (currentTeam === 2 && isCorrect) || (currentTeam === 1 && !isCorrect && currentState!.team2HasDoubleOption)
          ? currentState!.currentQuestion.correct_answer 
          : null;
        
        // Determine next game phase
        let nextGamePhase;
        if (isCorrect) {
          // If correct, switch to other team for new question
          nextGamePhase = currentTeam === 1 ? 'team2_turn' : 'team1_turn';
        } else {
          // If wrong, other team gets to try same question
          nextGamePhase = currentTeam === 1 ? 'team2_turn' : 'team1_turn';
        }
        
        update(state => ({
          ...state,
          session: updatedSession,
          lastAnswer: { team: currentTeam, correct: isCorrect, points: pointsAwarded },
          gamePhase: nextGamePhase,
          team2HasDoubleOption: currentTeam === 1 && !isCorrect,
          showCorrectAnswer: shouldShowCorrectAnswer ? currentState!.currentQuestion.correct_answer : null,
          lastCorrectAnswer: correctAnswerToStore
        }));

        // Trigger confetti animation
        setTimeout(() => createConfetti(isCorrect), 100);

        // Start fade out animation
        update(state => ({ ...state, isQuestionFading: true }));

        // Load new question only when:
        // 1. Someone got it right, OR
        // 2. Both teams got it wrong (team 2 just answered wrong and had double option)
        const shouldLoadNewQuestion = isCorrect || (currentTeam === 2 && !isCorrect && currentState!.team2HasDoubleOption);
        
        if (shouldLoadNewQuestion) {
          // Wait for fade out, then load new question and fade in
          setTimeout(() => {
            this.loadNextQuestion();
            update(state => ({ 
              ...state, 
              team2HasDoubleOption: false,
              showCorrectAnswer: null,
              isQuestionFading: false
            }));
          }, 3500);
        } else {
          // Just fade back in for the other team's turn on same question
          setTimeout(() => {
            update(state => ({ ...state, isQuestionFading: false }));
          }, 500);
        }
      } catch (error) {
        console.error('Error submitting answer:', error);
      }
    },

    async chooseNewQuestion() {
      await this.loadNextQuestion();
      update(state => ({ 
        ...state, 
        team2HasDoubleOption: false,
        showCorrectAnswer: null,
        isQuestionFading: false
      }));
    },

    resetToSetup() {
      set({
        session: null,
        currentQuestion: null,
        isLoading: false,
        gamePhase: 'setup',
        team2HasDoubleOption: false,
        lastAnswer: null,
        showCorrectAnswer: null,
        loadError: null,
        isQuestionFading: false,
        lastCorrectAnswer: null
      });
    }
  };
}

export const gameStore = createGameStore();