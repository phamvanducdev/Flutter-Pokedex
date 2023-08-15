import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/utils/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonRepository {
  Future<List<PokemonSummary>> fetchPokemonsSummary() async {
    try {
      var response = await http.get(Uri.parse(ApiConstants.pokedexSummary));
      return List<PokemonSummary>.from(
        jsonDecode(
          const Utf8Decoder().convert(response.body.codeUnits),
        ).map(
          (model) => PokemonSummary.fromJson(model),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Pokemon> fetchPokemonDetail(String number) async {
    var response = await http.get(Uri.parse(ApiConstants.pokemonDetails(number)));
    return Pokemon.fromJson(
      jsonDecode(
        const Utf8Decoder().convert(response.body.codeUnits),
      ),
    );
  }

  Future<List<String>> fetchPokemonsFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.getStringList('favorites-pokemons');
    return favorites ?? [];
  }

  Future<void> savePokemonsFavorite(List<String> favorites) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites-pokemons', favorites);
  }
}
