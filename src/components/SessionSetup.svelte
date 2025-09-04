<script lang="ts">
  import { Play, Search } from 'lucide-svelte';
  import { generateWordCombination } from '../lib/wordCombinations';
  import { gameStore } from '../lib/gameStore';

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
      <div class="bg-brand-dark rounded-s p-6 mb-4">
        <div class="flex items-center justify-between gap-4">
          <!-- Logo -->
          <div class="flex-shrink-0 w-24 h-12 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="99.866" height="36.914" viewBox="0 0 99.866 36.914">
  <g id="Group_194" data-name="Group 194" transform="translate(-385.865 -654.357)">
    <path id="icon-pålogget" d="M19.045,4.281A14.764,14.764,0,1,0,33.809,19.045,14.764,14.764,0,0,0,19.045,4.281Zm0-3.281A18.045,18.045,0,1,0,37.09,19.045,18.045,18.045,0,0,0,19.045,1Zm0,27.888A9.843,9.843,0,0,1,9.2,19.045H28.888A9.843,9.843,0,0,1,19.045,28.888Zm5.684-6.562H13.361a6.564,6.564,0,0,0,11.368,0Z" transform="translate(384.865 654.181)" fill="#fff" fill-rule="evenodd"/>
    <g id="Group_192" data-name="Group 192" transform="translate(423.624 661.188)">
      <path id="Subtraction_3" data-name="Subtraction 3" d="M13.095,27.945H6.087L0,2.761H0c.062-.018.636-.187,1.544-.431.88-.236,2.264-.593,3.855-.949C7.188.98,8.868.661,10.395.431A34.29,34.29,0,0,1,15.36,0a15.35,15.35,0,0,1,1.687.085,8.246,8.246,0,0,1,1.431.276,11.8,11.8,0,0,1,2.2.914,12.353,12.353,0,0,1,2.059,1.389,11.347,11.347,0,0,1,1.751,1.819,9.828,9.828,0,0,1,1.278,2.2,8.859,8.859,0,0,1,.66,3.982,10.045,10.045,0,0,1-.407,2.235,12.61,12.61,0,0,1-1,2.371,14.3,14.3,0,0,1-1.5,2.253,12.952,12.952,0,0,1-5.249,3.847,14.253,14.253,0,0,1-3.108.855,12.251,12.251,0,0,1-1.856.158h0c-.134,0-.209,0-.209,0v5.562ZM12.268,7.29a14.168,14.168,0,0,0-2.035.155c-.515.076-.85.154-.854.155a2.5,2.5,0,0,1,.795.775,6.056,6.056,0,0,1,.621,1.209,16.1,16.1,0,0,1,.8,3.058c.105.6.253,1.573.36,2.807.064.74.083,1.225.083,1.23a10.056,10.056,0,0,0,.982-.34c.339-.135.671-.284.987-.444a10.232,10.232,0,0,0,1.1-.643,6.143,6.143,0,0,0,1.915-1.935A3.983,3.983,0,0,0,17.52,12a3.926,3.926,0,0,0,.059-.751,4.43,4.43,0,0,0-.092-.816,3.827,3.827,0,0,0-.291-.878,3.316,3.316,0,0,0-.453-.7,3.445,3.445,0,0,0-.586-.549,4.114,4.114,0,0,0-.689-.41,6.011,6.011,0,0,0-1.57-.473A9.846,9.846,0,0,0,12.268,7.29Z" transform="translate(0 0)" fill="#fff" opacity="0.999"/>
      <path id="Subtraction_1" data-name="Subtraction 1" d="M11.654,23.307a11.736,11.736,0,0,1-2.349-.237,11.59,11.59,0,0,1-4.167-1.753A11.687,11.687,0,0,1,.916,16.19,11.593,11.593,0,0,1,.237,14a11.766,11.766,0,0,1,0-4.7A11.59,11.59,0,0,1,1.99,5.138,11.687,11.687,0,0,1,7.118.916,11.592,11.592,0,0,1,9.305.237a11.766,11.766,0,0,1,4.7,0A11.59,11.59,0,0,1,18.169,1.99a11.687,11.687,0,0,1,4.222,5.127A11.6,11.6,0,0,1,23.07,9.3a11.766,11.766,0,0,1,0,4.7,11.591,11.591,0,0,1-1.753,4.167,11.688,11.688,0,0,1-5.127,4.222A11.592,11.592,0,0,1,14,23.07,11.736,11.736,0,0,1,11.654,23.307ZM12.9,4.28a4.317,4.317,0,0,0-2.425.741A4.351,4.351,0,0,0,8.9,6.929a4.331,4.331,0,0,0,.4,4.113,4.351,4.351,0,0,0,1.908,1.572,4.331,4.331,0,0,0,4.113-.4,4.35,4.35,0,0,0,1.572-1.908,4.332,4.332,0,0,0-.4-4.114,4.352,4.352,0,0,0-1.908-1.572A4.312,4.312,0,0,0,12.9,4.28Z" transform="translate(18.2 4.602)" fill="#fff" opacity="0.997"/>
      <path id="Subtraction_2" data-name="Subtraction 2" d="M.49,27.627h0L0,.143H0C.059.139.589.1,1.422.07,2.534.024,3.706,0,4.813,0,6.13,0,7.4.033,8.576.1c1.437.078,2.758.2,3.926.376a20.811,20.811,0,0,1,3.5.781,9.541,9.541,0,0,1,1.4.583,5.045,5.045,0,0,1,1.073.732,10.138,10.138,0,0,1,2.237,3A10.956,10.956,0,0,1,21.392,7.3a11.7,11.7,0,0,1,.385,1.85,12.459,12.459,0,0,1,.091,1.918,13.086,13.086,0,0,1-.206,1.946,13.638,13.638,0,0,1-1.3,3.815,5.944,5.944,0,0,1-.55.868,6.791,6.791,0,0,1-.685.767,8.972,8.972,0,0,1-1.679,1.257,15.746,15.746,0,0,1-3.94,1.578c-.6.16-1.235.3-1.886.419-.52.094-1.051.175-1.579.238-.892.107-1.483.131-1.489.131L8.172,26.82.49,27.627ZM8.446,6.715c-.3,0-.493.011-.513.012a2.423,2.423,0,0,1,.4.862,8.387,8.387,0,0,1,.238,1.284A25.473,25.473,0,0,1,8.7,12.045c-.025,2.114-.206,4.046-.214,4.127A9.593,9.593,0,0,0,9.469,16c.344-.078.684-.172,1.012-.278a10.1,10.1,0,0,0,1.163-.456,6.412,6.412,0,0,0,2.2-1.6,4.38,4.38,0,0,0,.74-1.221,4.294,4.294,0,0,0,.217-.732,4.731,4.731,0,0,0,.09-.82,4.008,4.008,0,0,0-.052-.763,3.326,3.326,0,0,0-.183-.664A3.186,3.186,0,0,0,13.96,8.4,4.441,4.441,0,0,0,12.636,7.5a7.627,7.627,0,0,0-1.553-.508,11.54,11.54,0,0,0-1.493-.223C9.21,6.732,8.825,6.715,8.446,6.715Z" transform="matrix(0.995, 0.105, -0.105, 0.995, 40.354, 0.321)" fill="#fff" opacity="0.999"/>
    </g>
    <path id="Path_1850" data-name="Path 1850" d="M2.351,4.954H1.326V.8H0V0H3.677V.8H2.351Zm2.868.077A1.622,1.622,0,0,1,3.37,3.209a2.486,2.486,0,0,1,.2-1.033,1.535,1.535,0,0,1,.576-.68,1.636,1.636,0,0,1,.9-.241,1.48,1.48,0,0,1,1.238.537A2.245,2.245,0,0,1,6.6,3.419H4.368a.937.937,0,0,0,.286.7,1.248,1.248,0,0,0,.754.185,2.518,2.518,0,0,0,.527-.056A4.964,4.964,0,0,0,6.468,4.1L6.4,4.786a2.9,2.9,0,0,1-.541.181A2.931,2.931,0,0,1,5.219,5.03ZM5.072,1.947a.609.609,0,0,0-.5.209,1.258,1.258,0,0,0-.216.691L5.7,2.84a1.194,1.194,0,0,0-.153-.663A.53.53,0,0,0,5.072,1.947ZM10.514,4.3l-.077.621a1.4,1.4,0,0,1-.244.063,1.713,1.713,0,0,1-.307.028q-.628,0-.754-.488a1.276,1.276,0,0,1-.419.359,1.323,1.323,0,0,1-.635.136.99.99,0,0,1-.788-.3,1.043,1.043,0,0,1-.258-.708.991.991,0,0,1,.321-.75,1.683,1.683,0,0,1,1-.373l.747-.07V2.714a.757.757,0,0,0-.143-.5.772.772,0,0,0-.59-.167,3.136,3.136,0,0,0-.565.052,4.1,4.1,0,0,0-.607.164l.1-.788a3.664,3.664,0,0,1,.572-.157,3.456,3.456,0,0,1,.656-.059A1.7,1.7,0,0,1,9.7,1.594a1.252,1.252,0,0,1,.363.987l-.021,1.381q0,.363.286.363A.8.8,0,0,0,10.514,4.3ZM8,3.893q0,.44.467.44A.991.991,0,0,0,8.8,4.277.937.937,0,0,0,9.1,4.1L9.1,3.412H8.679a.9.9,0,0,0-.527.115A.432.432,0,0,0,8,3.893Zm3,1.06V1.4l.977-.147v.481a1.816,1.816,0,0,1,.527-.356,1.493,1.493,0,0,1,.6-.119.9.9,0,0,1,.935.565A2,2,0,0,1,14.6,1.4a1.452,1.452,0,0,1,.652-.147.972.972,0,0,1,.792.314,1.5,1.5,0,0,1,.262.97V4.954h-.984V2.763a.757.757,0,0,0-.122-.474.465.465,0,0,0-.387-.153,1.168,1.168,0,0,0-.328.049,2,2,0,0,0-.335.133q.007.1.007.223V4.954h-.984V2.763q0-.628-.516-.628a1.45,1.45,0,0,0-.677.188v2.63Z" transform="translate(421.313 658.025) rotate(-13)" fill="#fff"/>
  </g>
</svg> 

          </div>
          
          <!-- Text -->
          <div class="flex-1 text-center">
            <h1 class="text-2xl font-bold text-white mb-1">
              🎯 POP-quiz
            </h1>
            <p class="text-sm text-white mb-1">
              En produkt-team quiz fra Team POP i NRK. Del teamet ditt i to lag, og svar på annen hvert spørsmål. Konkurrer, fortsett over flere sesjoner, og le av litt rare AI-genererte spørsmål.
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Session setup card -->
    <div class="bg-white rounded-s shadow-2xl p-8">
    <div class="flex mb-6 bg-gray-100 rounded-s p-1">
      <button
        on:click={() => mode = 'create'}
        class="flex-1 py-3 px-4 rounded-s font-medium transition-all {mode === 'create'
          ? 'bg-brand-dark text-white shadow-md'
          : 'text-gray-600 hover:text-brand-dark'}"
      >
        Nytt spill
      </button>
      <button
        on:click={() => mode = 'load'}
        class="flex-1 py-3 px-4 rounded-s font-medium transition-all {mode === 'load'
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
              class="flex-1 px-4 py-3 border border-gray-300 rounded-s focus:ring-2 focus:border-transparent text-lg font-mono"
              placeholder="f.eks. gul bjørn"
            />
            <button
              on:click={generateNew}
              class="px-4 py-3 bg-gray-100 border border-gray-300 rounded-s hover:bg-gray-200 transition-colors"
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
              class="w-full px-4 py-3 border-2 border-brand-light rounded-s focus:ring-2 focus:ring-brand-dark focus:border-transparent text-lg"
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
              class="w-full px-4 py-3 border-2 border-accent-light rounded-s focus:ring-2 focus:ring-accent-dark focus:border-transparent text-lg"
              placeholder="Navn på lag 2"
            />
          </div>
        </div>

        <button
          on:click={handleCreateSession}
          disabled={isLoading || !wordCombination || !team1Name || !team2Name}
          class="w-full bg-brand-dark hover:bg-opacity-90 disabled:opacity-50 text-white py-4 px-6 rounded-s font-medium text-lg transition-all flex items-center justify-center gap-2"
        >
          {#if isLoading}
            <div class="animate-spin h-5 w-5 border-2 border-white border-t-transparent rounded-s"></div>
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
            class="w-full px-4 py-3 border border-gray-300 rounded-s focus:ring-2 focus:border-transparent text-lg font-mono"
            placeholder="f.eks. gul bjørn"
          />
        </div>

        <button
          on:click={handleLoadSession}
          disabled={isLoading || !loadWordCombination}
          class="w-full bg-accent-dark hover:bg-opacity-90 disabled:opacity-50 text-white py-4 px-6 rounded-s font-medium text-lg transition-all flex items-center justify-center gap-2"
        >
          {#if isLoading}
            <div class="animate-spin h-5 w-5 border-2 border-white border-t-transparent rounded-s"></div>
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