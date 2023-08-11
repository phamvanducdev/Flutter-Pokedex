import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/table_moves.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class TechnicalMachinesMovesTableWidget extends StatelessWidget {
  final List<Move> moves;

  const TechnicalMachinesMovesTableWidget({
    super.key,
    required this.moves,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;

    return TableMovesWidget(
      columns: [
        Text(
          'TM',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
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
              Row(
                children: [
                  Image.asset(
                    "assets/images/technical_machines_types/TM_${move.type}.png",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    move.technicalMachine.toString(),
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
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
