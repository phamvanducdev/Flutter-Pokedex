import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/storages/items.dart';
import 'package:pokedex/shared/utils/api_constants.dart';
import 'package:pokedex/shared/storages/pokedex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  PokedexStorage pokedexStorage = GetIt.instance<PokedexStorage>();
  ItemsStorage itemsStorage = GetIt.instance<ItemsStorage>();

  @override
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

  @override
  Future<List<Item>> fetchItems() async {
    if (itemsStorage.getItems().isNotEmpty) {
      return itemsStorage.getItems();
    }
    try {
      var response = await http.get(Uri.parse(ApiConstants.pokemonItems));
      debugPrint(response.body);
      var items = List<Item>.from(
        jsonDecode(
          const Utf8Decoder().convert(response.body.codeUnits),
        ).map(
          (model) => Item.fromJson(model),
        ),
      );
      itemsStorage.setItems(items);
      return items;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Pokemon> fetchPokemonDetail(String number) async {
    if (pokedexStorage.getPokemonDetail(number) != null) {
      return pokedexStorage.getPokemonDetail(number)!;
    }
    var response = await http.get(Uri.parse(ApiConstants.pokemonDetails(number)));
    var pokemon = Pokemon.fromJson(
      jsonDecode(
        const Utf8Decoder().convert(response.body.codeUnits),
      ),
    );
    pokedexStorage.insertPokemonDetail(pokemon);
    return pokemon;
  }

  @override
  Future<List<String>> fetchPokemonsFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var favorites = prefs.getStringList('favorites-pokemons');
    return favorites ?? [];
  }

  @override
  Future<void> savePokemonsFavorite(List<String> favorites) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites-pokemons', favorites);
  }
}
