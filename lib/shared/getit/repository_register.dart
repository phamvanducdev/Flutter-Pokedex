import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/repositories/impl/pokemon_repository_impl.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';

class RepositoryRegister extends IGetItRegister {
  final GetIt instance = GetIt.instance;

  @override
  Future<void> register() async {
    if (!GetIt.I.isRegistered<PokemonRepository>()) {
      instance.registerSingleton<PokemonRepository>(PokemonRepositoryImpl());
    }
  }
}
