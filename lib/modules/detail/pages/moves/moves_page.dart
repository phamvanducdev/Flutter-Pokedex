import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/egg_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/evolution_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/level_up_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/technical_machines_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/technical_records_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/tutor_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/shared/extension/list_extension.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class MovesPage extends StatelessWidget {
  final PokemonDetailViewModel viewModel;

  const MovesPage({
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

        if (pokemon == null) {
          return SizedBox(
            width: size.width,
            height: size.height,
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Column(
            children: [
              StreamBuilder<List<MoveState>>(
                  stream: viewModel.streamMoves,
                  builder: (context, snapshot) {
                    var moves = snapshot.data.orEmpty;
                    if (moves.isEmpty) return Container();

                    return ExpansionPanelList(
                      elevation: 0,
                      dividerColor: appColors.backgroundColor,
                      expansionCallback: (index, isExpanded) {
                        viewModel.setMoveExpanded(moves[index].type, isExpanded);
                      },
                      expandedHeaderPadding: EdgeInsets.zero,
                      children: moves.map(
                        (moveState) {
                          return ExpansionPanel(
                            isExpanded: moveState.isExpanded,
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) {
                              return SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 24,
                                  ),
                                  child: Text(
                                    MoveState.getHeaderTitle(moveState),
                                    textAlign: TextAlign.start,
                                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            body: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: MoveState.getBodyWidget(moveState),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  }),
              const SizedBox(height: 120),
            ],
          ),
        );
      },
    );
  }
}
