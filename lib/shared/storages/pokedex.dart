// ignore_for_file: prefer_final_fields, sdk_version_since

import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';

class PokedexStorage {
  final Map<String, PokemonSummary> _pokemonsMap = {};
  final Map<String, Pokemon> _pokemonsDetailMap = {};

  List<PokemonSummary> getPokemons() => _pokemonsMap.values.toList();

  void setPokemons(List<PokemonSummary> pokemons) {
    for (var pokemon in pokemons) {
      _pokemonsMap[pokemon.number] = pokemon;
    }
  }

  Pokemon? getPokemonDetail(String number) => _pokemonsDetailMap[number];

  void insertPokemonDetail(Pokemon pokemon) {
    _pokemonsDetailMap[pokemon.number] = pokemon;
  }
}
