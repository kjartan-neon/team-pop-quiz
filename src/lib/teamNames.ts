const adjectives = [
  'gule', 'blå', 'røde', 'grønne', 'lilla', 'rosa', 'oransje', 'grå', 'svarte', 'hvite',
  'glade', 'triste', 'sinte', 'snille', 'morsomme', 'kloke', 'raske', 'langsomme', 'høye', 'lave',
  'store', 'små', 'nye', 'gamle', 'varme', 'kalde', 'myke', 'harde', 'lette', 'tunge',
  'sterke', 'svake', 'smarte', 'dumme', 'fine', 'stygge', 'rike', 'fattige', 'lykkelige', 'ulykkelige',
  'modige', 'feige', 'stolte', 'ydmyke', 'ville', 'tamme', 'farlige', 'trygge', 'hemmelige', 'åpne'
];

const nouns = [
  'bjørnene', 'hundene', 'kattene', 'fuglene', 'fiskene', 'elgene', 'reinene', 'ulvene', 'revene', 'harene',
  'bilene', 'togene', 'flyene', 'båtene', 'syklene', 'husene', 'trærne', 'blomstene', 'steinene', 'stjernene',
  'løvene', 'tigrene', 'elefantene', 'apene', 'slangene', 'ørnene', 'hvalene', 'delfinen', 'hestene', 'kyrne',
  'grisene', 'sauene', 'geitene', 'hønsene', 'endene', 'gåsene', 'musene', 'rottene', 'ekornene', 'igelkottene',
  'vikingene', 'ridderne', 'prinsessene', 'kongene', 'dronningene', 'trollene', 'alvene', 'dvergene', 'gigantene', 'heksene'
];

export function generateTeamName(): string {
  const adjective = adjectives[Math.floor(Math.random() * adjectives.length)];
  const noun = nouns[Math.floor(Math.random() * nouns.length)];
  return `De ${adjective} ${noun}`;
}