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
                    return ExpansionPanelList(
                      elevation: 0,
                      dividerColor: appColors.backgroundColor,
                      expansionCallback: (index, isExpanded) {
                        viewModel.setMoveExpanded(moves[index].type, isExpanded);
                      },
                      expandedHeaderPadding: EdgeInsets.zero,
                      children: moves.map(
                        (move) {
                          String titleHeader;
                          switch (move.type) {
                            case MoveType.levelUp:
                              titleHeader = 'Moves learnt by level up';
                              break;
                            case MoveType.technicalMachine:
                              titleHeader = 'Moves learnt by Technical Machines';
                              break;
                            case MoveType.technicalRecords:
                              titleHeader = 'Moves learnt by Technical Records';
                              break;
                            case MoveType.evolution:
                              titleHeader = 'Moves learnt on evolution';
                              break;
                            case MoveType.egg:
                              titleHeader = 'Egg moves';
                              break;
                            case MoveType.tutor:
                              titleHeader = 'Tutor moves';
                              break;
                          }

                          StatelessWidget widgetBody;
                          switch (move.type) {
                            case MoveType.levelUp:
                              widgetBody = LevelUpMovesTableWidget(moves: move.moves);
                              break;
                            case MoveType.technicalMachine:
                              widgetBody = TechnicalMachinesMovesTableWidget(moves: move.moves);
                              break;
                            case MoveType.technicalRecords:
                              widgetBody = TechnicalRecordsMovesTableWidget(moves: move.moves);
                              break;
                            case MoveType.evolution:
                              widgetBody = EvolutionMovesTableWidget(moves: move.moves);
                              break;
                            case MoveType.egg:
                              widgetBody = EggMovesTableWidget(moves: move.moves);
                              break;
                            case MoveType.tutor:
                              widgetBody = TutorMovesTableWidget(moves: move.moves);
                              break;
                          }
                          return ExpansionPanel(
                            isExpanded: move.isExpanded,
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) {
                              return SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 24,
                                  ),
                                  child: Text(
                                    titleHeader,
                                    textAlign: TextAlign.start,
                                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            body: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: widgetBody,
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
