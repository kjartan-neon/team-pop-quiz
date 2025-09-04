<script lang="ts">
  import { Play, Search } from 'lucide-svelte';
  import { generateWordCombination } from '../lib/wordCombinations';
  import { gameStore } from '../lib/gameStore';
  import Logo from './Logo.svelte';

  let mode: 'create' | 'load' = 'create';
  let wordCombination = generateWordCombination();
  let team1Name = 'Lag 1';
  let team2Name = 'Lag 2';
  let loadWordCombination = '';
  let isLoading = false;

  gameStore.subscribe(state => {
    isLoading = state.isLoading;
  });

  function handleCreateSession() {
    gameStore.createSession(wordCombination, team1Name, team2Name);
  }

  function handleLoadSession() {
    gameStore.loadSession(loadWordCombination.toLowerCase());
  }

  function generateNew() {
    wordCombination = generateWordCombination();
  }
</script>

<div class="min-h-screen bg-gradient-blue-orange flex items-center justify-center p-4">
  <div class="w-full max-w-2xl">
    <!-- Header outside the card -->
    <div class="text-center mb-8">
      <div class="relative overflow-hidden rounded-xl p-4 mb-4" style="background-color: var(--brand-dark);">
        <!-- Animated yellow circles background -->
        <div class="absolute inset-0">
          {#each Array(15) as _, i}
            <div 
              class="absolute w-2 h-2 bg-yellow-300 rounded-full animate-pulse"
              style="
                left: {Math.random() * 100}%;
                top: {Math.random() * 100}%;
                animation-delay: {Math.random() * 3}s;
                animation-duration: {2 + Math.random() * 2}s;
              "
            ></div>
          {/each}
          {#each Array(10) as _, i}
            <div 
              class="absolute w-1 h-1 bg-yellow-300 rounded-full star-twinkle"
              style="
                left: {Math.random() * 100}%;
                top: {Math.random() * 100}%;
                animation-delay: {Math.random() * 4}s;
              "
            ></div>
          {/each}
          {#each Array(6) as _, i}
            <div 
              class="absolute w-3 h-3 bg-yellow-300 rounded-full star-swirl opacity-70"
              style="
                left: {Math.random() * 90}%;
                top: {Math.random() * 90}%;
                animation-delay: {Math.random() * 6}s;
              "
            ></div>
          {/each}
        </div>
        
        <!-- Header content with logo left and text right -->
        <div class="relative z-10 flex items-center gap-4">
          <Logo className="h-12 w-12 max-w-[50px] max-h-[50px] text-white flex-shrink-0" />
          <div class="text-left flex-1">
            <h1 class="text-xl font-bold text-white mb-1 animate-bounce-subtle">
              POP-quiz
            </h1>
            <p class="text-sm text-white mb-1 font-medium animate-fade-in">
              Presentert av NRKs beste team
            </p>
            <p class="text-lg font-bold text-yellow-300 animate-glow">
              Team POP
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Session setup card -->
    <div class="bg-white rounded-2xl shadow-2xl p-8">
    <div class="flex mb-6 bg-gray-100 rounded-lg p-1">
      <button
        on:click={() => mode = 'create'}
        class="flex-1 py-3 px-4 rounded-md font-medium transition-all {mode === 'create'
          ? 'bg-brand-dark text-white shadow-md'
          : 'text-gray-600 hover:text-brand-dark'}"
      >
        Nytt spill
      </button>
      <button
        on:click={() => mode = 'load'}
        class="flex-1 py-3 px-4 rounded-md font-medium transition-all {mode === 'load'
          ? 'bg-brand-dark text-white shadow-md'
          : 'text-gray-600 hover:text-brand-dark'}"
      >
        Fortsett spill
      </button>
    </div>

    {#if mode === 'create'}
      <div class="space-y-6">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Sesjonsord (skriv ned for å fortsette senere)
          </label>
          <div class="flex gap-2">
            <input
              type="text"
              bind:value={wordCombination}
              class="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:border-transparent text-lg font-mono"
              placeholder="f.eks. gul bjørn"
            />
            <button
              on:click={generateNew}
              class="px-4 py-3 bg-gray-100 border border-gray-300 rounded-lg hover:bg-gray-200 transition-colors"
            >
              Nytt
            </button>
          </div>
        </div>

        <div class="grid md:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
              Navn på Lag 1 (Mørkeblå)
            </label>
            <input
              type="text"
              bind:value={team1Name}
              class="w-full px-4 py-3 border-2 border-brand-light rounded-lg focus:ring-2 focus:ring-brand-dark focus:border-transparent text-lg"
              placeholder="Navn på lag 1"
            />
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
              Navn på Lag 2 (Korall)
            </label>
            <input
              type="text"
              bind:value={team2Name}
              class="w-full px-4 py-3 border-2 border-accent-light rounded-lg focus:ring-2 focus:ring-accent-dark focus:border-transparent text-lg"
              placeholder="Navn på lag 2"
            />
          </div>
        </div>

        <button
          on:click={handleCreateSession}
          disabled={isLoading || !wordCombination || !team1Name || !team2Name}
          class="w-full bg-brand-dark hover:bg-opacity-90 disabled:opacity-50 text-white py-4 px-6 rounded-lg font-medium text-lg transition-all flex items-center justify-center gap-2"
        >
          {#if isLoading}
            <div class="animate-spin h-5 w-5 border-2 border-white border-t-transparent rounded-full"></div>
          {:else}
            <Play class="h-5 w-5" />
            Start Quiz
          {/if}
        </button>
      </div>
    {:else}
      <div class="space-y-6">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Skriv inn sesjonsord
          </label>
          <input
            type="text"
            bind:value={loadWordCombination}
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:border-transparent text-lg font-mono"
            placeholder="f.eks. gul bjørn"
          />
        </div>

        <button
          on:click={handleLoadSession}
          disabled={isLoading || !loadWordCombination}
          class="w-full bg-accent-dark hover:bg-opacity-90 disabled:opacity-50 text-white py-4 px-6 rounded-lg font-medium text-lg transition-all flex items-center justify-center gap-2"
        >
          {#if isLoading}
            <div class="animate-spin h-5 w-5 border-2 border-white border-t-transparent rounded-full"></div>
          {:else}
            <Search class="h-5 w-5" />
            Last inn spill
          {/if}
        </button>
      </div>
    {/if}
    </div>
  </div>
</div>