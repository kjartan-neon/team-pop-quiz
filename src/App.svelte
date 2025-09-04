<script lang="ts">
  import SessionSetup from './components/SessionSetup.svelte';
  import ScoreBoard from './components/ScoreBoard.svelte';
  import QuestionCard from './components/QuestionCard.svelte';
  import { gameStore } from './lib/gameStore';

  let gameState = {
    session: null,
    currentQuestion: null,
    isLoading: false,
    gamePhase: 'setup',
    team2HasDoubleOption: false,
    lastAnswer: null
  };

  gameStore.subscribe(state => {
    gameState = state;
  });

  $: currentTeam = gameState.gamePhase === 'team1_turn' ? 1 : 2;

  function handleAnswer(answer: string) {
    gameStore.submitAnswer(answer);
  }

  function handlePass() {
    gameStore.submitAnswer('', true);
  }

  function handleChooseNewQuestion() {
    gameStore.chooseNewQuestion();
  }

  function handleLoadNextQuestion() {
    gameStore.loadNextQuestion();
  }

  function handleBackToConfig() {
    gameStore.resetToSetup();
  }
</script>

{#if gameState.gamePhase === 'setup'}
  <SessionSetup />
{:else if !gameState.session || !gameState.currentQuestion}
  <div class="min-h-screen bg-gradient-blue-orange flex items-center justify-center">
    <div class="animate-spin h-12 w-12 border-4 border-blue-600 border-t-transparent rounded-full"></div>
  </div>
{:else}
  <div class="min-h-screen bg-gradient-brand-accent p-4">
    <div class="max-w-4xl mx-auto">
      <ScoreBoard 
        session={gameState.session}
        currentTurn={currentTeam}
      />
      
      <QuestionCard
        question={gameState.currentQuestion}
        {currentTeam}
        team1Name={gameState.session.team1_name}
        team2Name={gameState.session.team2_name}
        hasDoubleOption={gameState.team2HasDoubleOption}
        lastAnswer={gameState.lastAnswer}
        showCorrectAnswer={gameState.showCorrectAnswer}
        onAnswer={handleAnswer}
        onPass={handlePass}
        onChooseNewQuestion={gameState.team2HasDoubleOption ? handleChooseNewQuestion : undefined}
      />

      <div class="mt-6 text-center">
        <div class="flex gap-4 justify-center">
          <button
            on:click={handleLoadNextQuestion}
            class="bg-gray-600 hover:bg-gray-700 text-white py-2 px-4 rounded-s font-medium transition-colors"
          >
            Hopp til neste spørsmål
          </button>
          <button
            on:click={handleBackToConfig}
            class="bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 rounded-s font-medium transition-colors"
          >
            Tilbake til konfigurasjon
          </button>
        </div>
      </div>
    </div>
  </div>
{/if}