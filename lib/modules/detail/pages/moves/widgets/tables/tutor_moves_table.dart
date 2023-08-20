import 'package:flutter/material.dart';
import 'package:pokedex/modules/detail/pages/moves/widgets/table_moves.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

class TutorMovesTableWidget extends StatelessWidget {
  final List<Move> moves;

  const TutorMovesTableWidget({
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
