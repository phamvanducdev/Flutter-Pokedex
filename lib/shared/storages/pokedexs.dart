// ignore_for_file: prefer_final_fields, sdk_version_since

import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';

class PokedexStorage {
  final _pokemonsMap = <String, PokemonSummary>{};
  final _pokemonDetailMap = <String, Pokemon>{};

  List<PokemonSummary> getPokemons() => _pokemonsMap.values.toList();

  void setPokemons(List<PokemonSummary> pokemons) {
    for (var pokemon in pokemons) {
      _pokemonsMap[pokemon.number] = pokemon;
    }
  }

  Pokemon? getPokemonDetail(String number) => _pokemonDetailMap[number];

  void insertPokemonDetail(Pokemon pokemon) {
    _pokemonDetailMap[pokemon.number] = pokemon;
  }
}
