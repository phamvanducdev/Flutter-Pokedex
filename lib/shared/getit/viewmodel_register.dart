import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:pokedex/modules/home/home_vm.dart';
import 'package:pokedex/modules/items/items_vm.dart';
import 'package:pokedex/shared/getit/getit.dart';

class ViewModelRegister extends IGetItRegister {
  final GetIt instance = GetIt.instance;

  @override
  Future<void> register() async {
    instance.registerFactory<HomeViewModel>(
      () => HomeViewModel(),
    );

    instance.registerFactory<ItemsViewModel>(
      () => ItemsViewModel(),
    );

    instance.registerFactory<PokemonDetailViewModel>(
      () => PokemonDetailViewModel(),
    );
  }
}
