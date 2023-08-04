import 'package:flutter_pokedex/shared/caches/firestore_images.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/shared/getit/getit.dart';

class CacheRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<FirestoreImageCaches>()) {
      getIt.registerSingleton<FirestoreImageCaches>(FirestoreImageCaches());
    }
  }
}
