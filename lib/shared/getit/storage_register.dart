import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/storages/pokedexs.dart';

class StorageRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokedexStorage>()) {
      getIt.registerSingleton<PokedexStorage>(PokedexStorage());
    }
  }
}
