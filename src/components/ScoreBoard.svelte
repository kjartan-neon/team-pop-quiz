<script lang="ts">
  import { Trophy, Users } from 'lucide-svelte';
  import type { Session } from '../types/quiz';

  export let session: Session;
  export let currentTurn: number;
</script>

<div class="bg-white rounded-xl shadow-lg p-6 mb-6">
  <div class="flex items-center justify-center gap-2 mb-6">
    <Trophy class="h-6 w-6 text-yellow-500" />
    <h2 class="text-2xl font-bold text-gray-900">Poengstilling</h2>
  </div>
  
  <div class="grid grid-cols-2 gap-4">
    <div class="p-6 rounded-xl border-2 transition-all {currentTurn === 1
      ? 'border-brand-dark bg-brand-light shadow-md'
      : 'border-brand-light bg-opacity-50'}" style="background-color: {currentTurn === 1 ? 'var(--brand-light)' : 'rgb(from var(--brand-light) r g b / 0.5)'}">
      <div class="flex items-center gap-3 mb-3">
        <Users class="h-6 w-6 text-brand-dark" />
        <h3 class="text-xl font-semibold text-brand-dark">{session.team1_name}</h3>
        {#if currentTurn === 1}
          <span class="bg-brand-dark text-white px-2 py-1 rounded-full text-sm font-medium">
            DIN TUR
          </span>
        {/if}
      </div>
      <p class="text-3xl font-bold text-brand-dark">{session.team1_score} poeng</p>
    </div>

    <div class="p-6 rounded-xl border-2 transition-all {currentTurn === 2
      ? 'border-accent-dark bg-accent-light shadow-md'
      : 'border-accent-light accent-bg-opacity-50'}" style="background-color: {currentTurn === 2 ? 'var(--accent-light)' : 'rgb(from var(--accent-light) r g b / 0.5)'}">
      <div class="flex items-center gap-3 mb-3">
        <Users class="h-6 w-6 text-accent-dark" />
        <h3 class="text-xl font-semibold text-accent-dark">{session.team2_name}</h3>
        {#if currentTurn === 2}
          <span class="bg-accent-dark text-white px-2 py-1 rounded-full text-sm font-medium">
            DIN TUR
          </span>
        {/if}
      </div>
      <p class="text-3xl font-bold text-accent-dark">{session.team2_score} poeng</p>
    </div>
  </div>

  <div class="mt-4 text-center">
    <p class="text-sm text-gray-500">
      Sesjonsord: <span class="font-mono font-medium">{session.word_combination}</span>
    </p>
  </div>
</div>