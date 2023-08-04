import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';
import 'package:flutter_pokedex/shared/repositories/pokemon_repository.dart';

class HomeViewModel {
  PokemonRepository pokemonRepository = GetIt.instance<PokemonRepository>();

  List<PokemonSummary> _pokemons = List.empty();
  List<PokemonSummary> get pokemons => _pokemons;

  Future<void> fetchPokemonData() async {
    _pokemons = await pokemonRepository.fetchPokemonsSummary();
  }
}
