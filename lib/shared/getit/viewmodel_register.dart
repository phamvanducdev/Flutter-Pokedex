import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:pokedex/modules/home/home_vm.dart';
import 'package:pokedex/modules/items/items_vm.dart';
import 'package:pokedex/shared/getit/getit.dart';

class ViewModelRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(),
    );
    getIt.registerFactory<ItemsViewModel>(
      () => ItemsViewModel(),
    );
    getIt.registerFactory<PokemonDetailViewModel>(
      () => PokemonDetailViewModel(),
    );
  }
}
