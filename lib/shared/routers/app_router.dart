// ignore_for_file: constant_identifier_names

import 'package:flutter_pokedex/modules/detail/pokemon_detail_screen.dart';
import 'package:flutter_pokedex/modules/home/home_screen.dart';
import 'package:flutter_pokedex/modules/items/items_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter routers = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/details/:index',
        builder: (context, state) {
          var index = int.parse(state.pathParameters['index'] ?? '-1');
          return PokemonDetailScreen(index: index);
        },
      ),
      GoRoute(
        path: '/items',
        builder: (context, state) {
          return const ItemsScreen();
        },
      ),
    ],
  );
}

class AppRouterNames {
  static const String HOME = 'home';
  static const String ITEMS = 'items';
  static const String DETAILS = 'details';
}
