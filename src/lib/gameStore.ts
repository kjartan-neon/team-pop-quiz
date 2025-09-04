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
    lastAnswer: null
  });

  return {
    subscribe,
    
    async createSession(wordCombination: string, team1Name: string, team2Name: string) {
      update(state => ({ ...state, isLoading: true }));
      
      try {
        const { data: session, error } = await supabase
          .from('quiz_sessions')
          .insert({
            word_combination: wordCombination,
            team1_name: team1Name,
            team2_name: team2Name
          })
          .select()
          .single();

        if (error) throw error;

        update(state => ({
          ...state,
          session,
          gamePhase: 'team1_turn',
          isLoading: false
        }));

        await this.loadNextQuestion();
      } catch (error) {
        console.error('Error creating session:', error);
        update(state => ({ ...state, isLoading: false }));
      }
    },

    async loadSession(wordCombination: string) {
      update(state => ({ ...state, isLoading: true }));
      
      try {
        const { data: session, error } = await supabase
          .from('quiz_sessions')
          .select('*')
          .eq('word_combination', wordCombination)
          .single();

        if (error) throw error;

        update(state => ({
          ...state,
          session,
          gamePhase: session.current_turn === 1 ? 'team1_turn' : 'team2_turn',
          isLoading: false
        }));

        await this.loadNextQuestion();
      } catch (error) {
        console.error('Error loading session:', error);
        update(state => ({ ...state, isLoading: false }));
      }
    },

    async loadNextQuestion() {
      try {
        const { data: questions, error } = await supabase
          .from('quiz_questions')
          .select('*')
          .order('created_at', { ascending: false })
          .limit(50);

        if (error) throw error;

        if (questions && questions.length > 0) {
          const randomQuestion = questions[Math.floor(Math.random() * questions.length)];
          update(state => ({
            ...state,
            currentQuestion: randomQuestion,
            lastAnswer: null
          }));
        }
      } catch (error) {
        console.error('Error loading question:', error);
      }
    },

    async submitAnswer(answer: string, isPassed: boolean = false) {
      let currentState: GameState;
      const unsubscribe = subscribe(state => currentState = state);
      unsubscribe();

      if (!currentState!.session || !currentState!.currentQuestion) return;

      const currentTeam = currentState!.gamePhase === 'team1_turn' ? 1 : 2;
      let isCorrect = false;
      let pointsAwarded = 0;

      if (!isPassed) {
        if (currentState!.currentQuestion.question_type === 'multiple_choice') {
          isCorrect = answer === currentState!.currentQuestion.correct_answer;
        } else {
          const correctNumber = parseFloat(currentState!.currentQuestion.correct_answer);
          const userNumber = parseFloat(answer);
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
          // Negative points based on difficulty (half of positive points)
          let basePenalty = -12; // easy (-12)
          if (currentState!.currentQuestion.difficulty === 'medium') {
            basePenalty = -25;
          } else if (currentState!.currentQuestion.difficulty === 'hard') {
            basePenalty = -50;
          }
          pointsAwarded = basePenalty;
        }
      }

      const updatedSession = { ...currentState!.session };
      if (currentTeam === 1) {
        updatedSession.team1_score += pointsAwarded;
        updatedSession.current_turn = 2;
      } else {
        updatedSession.team2_score += pointsAwarded;
        updatedSession.current_turn = 1;
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
            answer_given: isPassed ? null : answer,
            is_correct: isPassed ? null : isCorrect,
            points_awarded: pointsAwarded
          });

        update(state => ({
          ...state,
          session: updatedSession,
          lastAnswer: { team: currentTeam, correct: isCorrect, points: pointsAwarded },
          gamePhase: currentTeam === 1 ? 'team2_turn' : 'team1_turn',
          team2HasDoubleOption: currentTeam === 1 && !isCorrect && !isPassed
        }));

        // Trigger confetti animation
        if (!isPassed) {
          setTimeout(() => createConfetti(isCorrect), 100);
        }

        if (currentTeam === 2 || (currentTeam === 1 && (isCorrect || isPassed))) {
          setTimeout(() => {
            this.loadNextQuestion();
            update(state => ({ ...state, team2HasDoubleOption: false }));
          }, 3000);
        }
      } catch (error) {
        console.error('Error submitting answer:', error);
      }
    },

    async chooseNewQuestion() {
      await this.loadNextQuestion();
      update(state => ({ ...state, team2HasDoubleOption: false }));
    },

    resetToSetup() {
      set({
        session: null,
        currentQuestion: null,
        isLoading: false,
        gamePhase: 'setup',
        team2HasDoubleOption: false,
        lastAnswer: null
      });
    }
  };
}

export const gameStore = createGameStore();