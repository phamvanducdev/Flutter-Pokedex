// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:pokedex/modules/detail/pokemon_detail_screen.dart';
import 'package:pokedex/modules/home/home_screen.dart';
import 'package:pokedex/modules/items/items_screen.dart';

class AppRouter {
  static GoRouter routers = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
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
