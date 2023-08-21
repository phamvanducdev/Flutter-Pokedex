import 'package:flutter_pokedex/modules/detail/pokemon_detail_screen.dart';
import 'package:flutter_pokedex/modules/items/items_screen.dart';
import 'package:flutter_pokedex/shared/routers/app_router.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/modules/home/home_screen.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetItRegister.register();
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.of(context),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routers,
    );
  }
}
