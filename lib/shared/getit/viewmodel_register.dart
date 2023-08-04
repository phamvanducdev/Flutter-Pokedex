import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/modules/home/home_vm.dart';
import 'package:flutter_pokedex/shared/getit/getit.dart';

class ViewModelRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(),
    );
    getIt.registerFactory<PokemonDetailViewModel>(
      () => PokemonDetailViewModel(),
    );
  }
}
