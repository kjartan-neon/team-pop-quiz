const adjectives = [
  'gul', 'blå', 'rød', 'grønn', 'lila', 'rosa', 'oransje', 'grå', 'svart', 'hvit',
  'glad', 'trist', 'sint', 'snill', 'morsom', 'klok', 'rask', 'langsom', 'høy', 'lav',
  'stor', 'liten', 'ny', 'gammel', 'varm', 'kald', 'myk', 'hard', 'lett', 'tung'
];

const nouns = [
  'bjørn', 'hund', 'katt', 'fugl', 'fisk', 'elg', 'rein', 'ulv', 'rev', 'hare',
  'bil', 'tog', 'fly', 'båt', 'sykkel', 'hus', 'tre', 'blomst', 'stein', 'stjerne',
  'sol', 'måne', 'sky', 'regn', 'snø', 'vind', 'skog', 'fjell', 'sjø', 'elv'
];

export function generateWordCombination(): string {
  const adjective = adjectives[Math.floor(Math.random() * adjectives.length)];
  const noun = nouns[Math.floor(Math.random() * nouns.length)];
  return `${adjective} ${noun}`;
}