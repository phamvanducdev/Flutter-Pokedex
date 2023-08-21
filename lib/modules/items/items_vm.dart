import 'package:flutter_pokedex/shared/repositories/pokemon_repository.dart';
import 'package:get_it/get_it.dart';

class ItemsViewModel {
  PokemonRepository repository = GetIt.instance.get<PokemonRepository>();
}
