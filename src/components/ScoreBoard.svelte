<script lang="ts">
  import { Trophy, Users } from 'lucide-svelte';
  import { CheckCircle, XCircle, Flag } from 'lucide-svelte';
  import type { Session } from '../types/quiz';

  export let session: Session;
  export let currentTurn: number;
  export let lastCorrectAnswer: string | null = null;
  export let lastAnswer: {
    team: number;
    correct: boolean;
    points: number;
  } | null = null;
  export let onFlagPreviousQuestion: (() => void) | undefined = undefined;
</script>

<div class="bg-white rounded-xl shadow-lg p-4 mb-4">  
  {#if lastAnswer}
    <div class="mb-3 p-3 flex items-center justify-center rounded-lg {lastAnswer.correct 
      ? 'bg-green-100 border border-green-300' 
      : 'bg-red-100 border border-red-300'}">
      <div class="flex items-center gap-2">
        {#if lastAnswer.correct}
          <CheckCircle class="h-5 w-5 text-green-600" />
        {:else}
          <XCircle class="h-5 w-5 text-red-600" />
        {/if}
        <p class="font-medium text-center">
          {lastAnswer.team === 1 ? session.team1_name : session.team2_name}: 
          {lastAnswer.correct ? 'Riktig!' : 'Feil!'} ({lastAnswer.points > 0 ? '+' : ''}{lastAnswer.points} poeng)
        </p>
      </div>
    </div>
  {/if}

  <div class="grid grid-cols-2 gap-4">
    <div class="p-4 rounded-xl border-2 transition-all {currentTurn === 1
      ? 'border-brand-dark bg-brand-light shadow-md'
      : 'border-brand-light bg-opacity-50'}" style="background-color: {currentTurn === 1 ? 'var(--brand-light)' : 'rgb(from var(--brand-light) r g b / 0.5)'}">
      <div class="flex items-center gap-2 mb-2 mobile-team-header">
        <Users class="h-5 w-5 text-brand-dark" />
        <div class="flex-1">
          <h3 class="text-lg font-semibold text-brand-dark">{session.team1_name}</h3>
          {#if currentTurn === 1}
            <div class="mobile-turn-marker">
              <span class="bg-brand-dark text-white px-2 py-0.5 rounded-full text-xs font-medium">
                DIN TUR
              </span>
            </div>
          {/if}
        </div>
        {#if currentTurn === 1}
          <span class="bg-brand-dark text-white px-2 py-0.5 rounded-full text-xs font-medium desktop-turn-marker">
            DIN TUR
          </span>
        {/if}
      </div>
      <p class="text-2xl font-bold text-brand-dark">{session.team1_score} poeng</p>
    </div>

    <div class="p-4 rounded-xl border-2 transition-all {currentTurn === 2
      ? 'border-accent-dark bg-accent-light shadow-md'
      : 'border-accent-light accent-bg-opacity-50'}" style="background-color: {currentTurn === 2 ? 'var(--accent-light)' : 'rgb(from var(--accent-light) r g b / 0.5)'}">
      <div class="flex items-center gap-2 mb-2 mobile-team-header">
        <Users class="h-5 w-5 text-accent-dark" />
        <div class="flex-1">
          <h3 class="text-lg font-semibold text-accent-dark">{session.team2_name}</h3>
          {#if currentTurn === 2}
            <div class="mobile-turn-marker">
              <span class="bg-accent-dark text-white px-2 py-0.5 rounded-full text-xs font-medium">
                DIN TUR
              </span>
            </div>
          {/if}
        </div>
        {#if currentTurn === 2}
          <span class="bg-accent-dark text-white px-2 py-0.5 rounded-full text-xs font-medium desktop-turn-marker">
            DIN TUR
          </span>
        {/if}
      </div>
      <p class="text-2xl font-bold text-accent-dark">{session.team2_score} poeng</p>
    </div>
  </div>

  {#if lastCorrectAnswer}
    <div class="mb-3 p-3 rounded-lg bg-blue-50 border border-blue-200 space-y-2">
      <p class="text-sm text-blue-700">
        <span class="font-medium">Svar på forrige spørsmål:</span> {lastCorrectAnswer}
      </p>
      {#if onFlagPreviousQuestion}
        <button
          on:click={onFlagPreviousQuestion}
          class="flex items-center gap-1 text-red-600 hover:text-red-800 text-sm font-medium transition-colors"
          title="Rapporter feil i forrige spørsmål"
        >
          <Flag class="h-4 w-4" />
          Rapporter feil i spørsmålet
        </button>
      {/if}
    </div>
  {/if}
</div>