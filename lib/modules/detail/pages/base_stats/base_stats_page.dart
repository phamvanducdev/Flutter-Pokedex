import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/base_stats/widgets/base_stats_item.dart';
import 'package:flutter_pokedex/modules/detail/pages/base_stats/widgets/table_row_factory.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class BaseStatsPage extends StatelessWidget {
  final PokemonDetailViewModel viewModel;
  const BaseStatsPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return StreamBuilder<Pokemon?>(
      stream: viewModel.streamPokemon,
      builder: (context, snapshot) {
        var pokemon = snapshot.data;
        if (pokemon == null) return Container();
        return SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseStatsItemWidget(
                  title: 'HP',
                  value: pokemon.baseStats.hp,
                ),
                BaseStatsItemWidget(
                  title: 'Attack',
                  value: pokemon.baseStats.attack,
                ),
                BaseStatsItemWidget(
                  title: 'Defense',
                  value: pokemon.baseStats.defense,
                ),
                BaseStatsItemWidget(
                  title: 'Sp. Atk',
                  value: pokemon.baseStats.spAtk,
                ),
                BaseStatsItemWidget(
                  title: 'Sp. Def',
                  value: pokemon.baseStats.spDef,
                ),
                BaseStatsItemWidget(
                  title: 'Speed',
                  value: pokemon.baseStats.speed,
                ),
                BaseStatsItemWidget(
                  title: 'Total',
                  value: pokemon.baseStats.total,
                  maxValue: 1200,
                ),
                const SizedBox(height: 32),
                Text(
                  "Type Effectiveness",
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Table(
                  columnWidths: const {0: FixedColumnWidth(100)},
                  children: [
                    TableRowFactory.build(context,
                        title: 'Damaged normally by',
                        types: pokemon.typesEffectiveness.entries.where((it) => it.value == '1')),
                    TableRowFactory.build(context,
                        title: 'Weak to', types: pokemon.typesEffectiveness.entries.where((it) => it.value == '2')),
                    TableRowFactory.build(context,
                        title: 'Resistant to',
                        types: pokemon.typesEffectiveness.entries.where((it) => it.value == '½' || it.value == '¼')),
                    TableRowFactory.build(context,
                        title: 'Immune to', types: pokemon.typesEffectiveness.entries.where((it) => it.value == '0')),
                  ],
                ),
                Container(height: 240),
              ],
            ),
          ),
        );
      },
    );
  }
}
