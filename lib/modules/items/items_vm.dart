import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';

class ItemsViewModel {
  PokemonRepository repository = GetIt.instance.get<PokemonRepository>();
}
