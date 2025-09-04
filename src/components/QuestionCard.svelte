<script lang="ts">
  import { CheckCircle, Zap } from 'lucide-svelte';
  import type { Question } from '../types/quiz';

  export let question: Question;
  export let currentTeam: number;
  export let team1Name: string;
  export let team2Name: string;
  export let hasDoubleOption: boolean;
  export let onAnswer: (answer: string) => void;
  export let onChooseNewQuestion: (() => void) | undefined = undefined;
  export let showCorrectAnswer: string | null = null;
  export let isQuestionFading: boolean = false;

  let selectedAnswer = '';
  let numberInput = '';

  $: currentTeamName = currentTeam === 1 ? team1Name : team2Name;

  function handleSubmit() {
    const answer = question.question_type === 'multiple_choice' ? selectedAnswer : numberInput.toString();
    if (answer) {
      onAnswer(answer);
      selectedAnswer = '';
      numberInput = '';
      // Smooth scroll to top to show results
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }

</script>

<div class="bg-white rounded-xl shadow-lg p-8 transition-all duration-500 {isQuestionFading ? 'fade-out' : 'fade-in'}">
  {#if showCorrectAnswer}
    <div class="mb-6 p-4 rounded-lg bg-blue-50 border border-blue-600">
      <div class="flex items-center gap-2">
        <CheckCircle class="h-5 w-5 text-blue-600" />
        <p class="font-medium text-blue-600">
          Riktig svar var: <span class="font-bold">{showCorrectAnswer}</span>
        </p>
      </div>
    </div>
  {/if}

  <div class="text-center mb-6">
    <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full border-2" 
         style="border-color: {currentTeam === 1 ? 'var(--brand-dark)' : 'var(--accent-dark)'}; 
                background-color: {currentTeam === 1 ? 'var(--brand-light)' : 'var(--accent-light)'}; 
                color: {currentTeam === 1 ? 'var(--brand-dark)' : 'var(--accent-dark)'}">
      <span class="text-lg font-bold">{currentTeamName} sin tur</span>
      {#if hasDoubleOption && currentTeam === 2}
        <Zap class="h-5 w-5 text-yellow-500" />
      {/if}
    </div>
    {#if hasDoubleOption && currentTeam === 2}
      <p class="text-sm text-yellow-600 font-medium mt-2">
        Dobbel poeng for samme spørsmål! ({question.difficulty === 'easy' ? '50p' : question.difficulty === 'medium' ? '100p' : '200p'})
      </p>
    {/if}
  </div>

  <div class="mb-8">
    <div class="flex justify-between items-center mb-4">
      <span class="text-sm font-medium text-gray-500 uppercase tracking-wide">
        {question.category}
      </span>
      <div class="flex items-center gap-2">
        <span class="text-sm px-2 py-1 rounded-full font-medium {question.difficulty === 'easy' 
          ? 'bg-green-100 text-green-600' 
          : question.difficulty === 'medium' 
          ? 'bg-yellow-100 text-yellow-600' 
          : 'bg-red-100 text-red-600'}">
          {question.difficulty === 'easy' ? '25p' : question.difficulty === 'medium' ? '50p' : '100p'}
        </span>
        <span class="text-sm text-gray-400">
          {question.question_type === 'number' ? 'Tallfelt' : 'Flervalg'}
        </span>
      </div>
    </div>
    
    <h3 class="text-2xl font-bold text-gray-900 leading-relaxed mb-6">
      {question.question_text}
    </h3>

    {#if question.question_type === 'multiple_choice'}
      <div class="space-y-3">
        {#each question.options || [] as option, index}
          <button
            on:click={() => selectedAnswer = option}
            class="w-full p-4 text-left rounded-lg border-2 transition-all {selectedAnswer === option
              ? (currentTeam === 1 ? 'border-brand-dark bg-brand-light' : 'border-accent-dark bg-accent-light')
              : 'border-gray-200 hover:border-gray-300 hover:bg-gray-50'}"
          >
            <span class="font-medium text-lg">{option}</span>
          </button>
        {/each}
      </div>
    {:else}
      <div>
        <input
          type="text"
          inputmode="numeric"
          pattern="[0-9]*"
          bind:value={numberInput}
          class="w-full px-4 py-4 text-xl border-2 rounded-lg focus:border-transparent"
          style="border-color: {currentTeam === 1 ? 'var(--brand-light)' : 'var(--accent-light)'};"
          placeholder="Skriv inn ditt svar..."
        />
        <p class="text-sm text-gray-500 mt-2">
          Aksepterer svar innenfor 10% feilmargin
        </p>
      </div>
    {/if}
  </div>

  <div class="space-y-3">
    <button
      on:click={handleSubmit}
      disabled={!selectedAnswer && (!numberInput || numberInput.trim() === '')}
      class="w-full disabled:opacity-50 text-white py-4 px-6 rounded-lg font-medium text-lg transition-all flex items-center justify-center gap-2"
      style="background-color: {currentTeam === 1 ? 'var(--brand-dark)' : 'var(--accent-dark)'}"
    >
      <CheckCircle class="h-5 w-5" />
      Svar
    </button>


    {#if hasDoubleOption && currentTeam === 2 && onChooseNewQuestion}
      <button
        on:click={onChooseNewQuestion}
        class="w-full bg-gray-700 hover:bg-gray-800 text-white py-3 px-6 rounded-lg font-medium transition-all flex items-center justify-center gap-2"
      >
        Nytt spørsmål (25p)
      </button>
    {/if}
  </div>
</div>