class ApiConstants {
  static String get pokedexSummary => 'https://pokedex.alansantos.dev/api/pokemons.json';

  static String pokemonDetails(String number) => 'https://pokedex.alansantos.dev/api/pokemons/$number.json';

  static String get pokemonItems => 'https://pokedex.alansantos.dev/api/items.json';
}

// pokedexSummary => "https://gist.githubusercontent.com/phamvanducdev/d91c4df3c219e54d062a6253459c9acc/raw/0afd6b3f93e5f9fd6383e969f0e690def962c226/pokemons_summary.json";
// pokemonItems => "https://gist.githubusercontent.com/phamvanducdev/b55e30c99926acff4cc6e65cd1e40192/raw/43230057d382933e175d413dd31e2fbf88c6a14d/pokemon_items.json";
