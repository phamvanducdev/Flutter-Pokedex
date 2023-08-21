import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/utils/api_constants.dart';
import 'package:pokedex/shared/storages/pokedexs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonRepository {
  PokedexStorage pokedexStorage = GetIt.instance<PokedexStorage>();

  Future<List<PokemonSummary>> fetchPokemonsSummary() async {
    if (pokedexStorage.getPokemons().isNotEmpty) {
      return pokedexStorage.getPokemons();
    }
    try {
      var response = await http.get(Uri.parse(ApiConstants.pokedexSummary));
      var pokemons = List<PokemonSummary>.from(
        jsonDecode(
          const Utf8Decoder().convert(response.body.codeUnits),
        ).map(
          (model) => PokemonSummary.fromJson(model),
        ),
      );
      pokedexStorage.setPokemons(pokemons);
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<Pokemon> fetchPokemonDetail(String number) async {
    if (pokedexStorage.getPokemonDetail(number) != null) {
      return pokedexStorage.getPokemonDetail(number)!;
    }
    var response =
        await http.get(Uri.parse(ApiConstants.pokemonDetails(number)));
    var pokemon = Pokemon.fromJson(
      jsonDecode(
        const Utf8Decoder().convert(response.body.codeUnits),
      ),
    );
    pokedexStorage.insertPokemonDetail(pokemon);
    return pokemon;
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
