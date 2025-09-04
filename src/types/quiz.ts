export interface Question {
  id: string;
  question_text: string;
  question_type: 'multiple_choice' | 'number';
  options?: string[];
  correct_answer: string;
  category: string;
  difficulty: string;
}

export interface Session {
  id: string;
  word_combination: string;
  team1_name: string;
  team2_name: string;
  team1_score: number;
  team2_score: number;
  current_turn: number;
  created_at: string;
  updated_at: string;
}

export interface GameHistory {
  id: string;
  session_id: string;
  question_id: string;
  team_number: number;
  answer_given?: string;
  is_correct?: boolean;
  points_awarded: number;
  answered_at: string;
}

export interface GameState {
  session: Session | null;
  currentQuestion: Question | null;
  isLoading: boolean;
  gamePhase: 'setup' | 'team1_turn' | 'team2_turn' | 'results';
  team2HasDoubleOption: boolean;
  lastAnswer: {
    team: number;
    correct: boolean;
    points: number;
  } | null;
  showCorrectAnswer: string | null;
  loadError: string | null;
  isQuestionFading: boolean;
}