import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';

class ItemsViewModel {
  PokemonRepository repository = GetIt.instance.get<PokemonRepository>();

  List<Item> _items = List.empty();
  List<Item> get items => _items;

  Future<void> fetchItems() async {
    _items = await repository.fetchItems();
  }
}
