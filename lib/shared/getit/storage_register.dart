import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/caches/firestore_images.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/storages/items.dart';
import 'package:pokedex/shared/storages/pokedex.dart';

class StorageRegister extends IGetItRegister {
  final GetIt instance = GetIt.instance;

  @override
  Future<void> register() async {
    if (!GetIt.I.isRegistered<FirestoreImageCacheStorage>()) {
      instance.registerSingleton<FirestoreImageCacheStorage>(
          FirestoreImageCacheStorage());
    }

    if (!GetIt.I.isRegistered<PokedexStorage>()) {
      instance.registerSingleton<PokedexStorage>(PokedexStorage());
    }

    if (!GetIt.I.isRegistered<ItemsStorage>()) {
      instance.registerSingleton<ItemsStorage>(ItemsStorage());
    }
  }
}
