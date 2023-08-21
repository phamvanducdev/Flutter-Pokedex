// ignore_for_file: prefer_final_fields, sdk_version_since

import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';

class PokedexStorage {
  Map<String, PokemonSummary> _pokemonSummaryMap = {};

  List<PokemonSummary> getPokemons() => _pokemonSummaryMap.values.toList();

  void setPokemons(List<PokemonSummary> pokemons) {
    for (var pokemon in pokemons) {
      _pokemonSummaryMap[pokemon.number] = pokemon;
    }
  }

  Map<String, Pokemon> _pokemonDetailMap = {};

  Pokemon? getPokemonDetail(String number) => _pokemonDetailMap[number];

  void insertPokemonDetail(Pokemon pokemon) {
    _pokemonDetailMap[pokemon.number] = pokemon;
  }
}
