import 'package:flutter_pokedex/shared/storages/pokedexs.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/shared/getit/getit.dart';

class StorageRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokedexStorage>()) {
      getIt.registerSingleton<PokedexStorage>(PokedexStorage());
    }
  }
}
