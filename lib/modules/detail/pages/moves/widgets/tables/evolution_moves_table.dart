import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/table_moves.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class EvolutionMovesTableWidget extends StatelessWidget {
  final List<Move> moves;

  const EvolutionMovesTableWidget({
    super.key,
    required this.moves,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;

    return TableMovesWidget(
      columns: [
        Text(
          'Move',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Type',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Cat.',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Power',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Acc.',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
      rows: moves
          .map(
            (move) => [
              Text(
                move.move,
                style: textTheme.bodyLarge,
              ),
              Column(
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: PokemonTypeBadge(
                      type: move.type,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
              Text(
                move.category,
                style: textTheme.bodyLarge,
              ),
              Text(
                move.power,
                style: textTheme.bodyLarge,
              ),
              Text(
                move.accuracy,
                style: textTheme.bodyLarge,
              ),
            ],
          )
          .toList(),
    );
  }
}
