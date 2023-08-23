import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';

abstract class PokemonRepository {
  Future<List<PokemonSummary>> fetchPokemonsSummary();

  Future<List<Item>> fetchItems();

  Future<Pokemon> fetchPokemonDetail(String number);

  Future<List<String>> fetchPokemonsFavorite();

  Future<void> savePokemonsFavorite(List<String> favorites);
}
