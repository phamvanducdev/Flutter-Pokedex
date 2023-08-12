import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/egg_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/evolution_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/level_up_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/technical_machines_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/technical_records_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/moves/widgets/tables/tutor_moves_table.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/sound_player.dart';
import 'package:flutter_pokedex/shared/extension/list_extension.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';
import 'package:flutter_pokedex/shared/repositories/pokemon_repository.dart';
import 'package:rxdart/rxdart.dart';

enum MoveType {
  levelUp,
  technicalMachine,
  technicalRecords,
  evolution,
  egg,
  tutor,
}

class MoveState {
  final MoveType type;
  final List<Move> moves;
  bool isExpanded;

  MoveState(
    this.type,
    this.moves,
    this.isExpanded,
  );

  static String getHeaderTitle(MoveState moveState) {
    switch (moveState.type) {
      case MoveType.levelUp:
        return 'Moves learnt by level up';
      case MoveType.technicalMachine:
        return 'Moves learnt by Technical Machines';
      case MoveType.technicalRecords:
        return 'Moves learnt by Technical Records';
      case MoveType.evolution:
        return 'Moves learnt on evolution';
      case MoveType.egg:
        return 'Egg moves';
      case MoveType.tutor:
        return 'Tutor moves';
    }
  }

  static Widget getBodyWidget(MoveState moveState) {
    switch (moveState.type) {
      case MoveType.levelUp:
        return LevelUpMovesTableWidget(moves: moveState.moves);
      case MoveType.technicalMachine:
        return TechnicalMachinesMovesTableWidget(moves: moveState.moves);
      case MoveType.technicalRecords:
        return TechnicalRecordsMovesTableWidget(moves: moveState.moves);
      case MoveType.evolution:
        return EvolutionMovesTableWidget(moves: moveState.moves);
      case MoveType.egg:
        return EggMovesTableWidget(moves: moveState.moves);
      case MoveType.tutor:
        return TutorMovesTableWidget(moves: moveState.moves);
    }
  }
}

class PokemonDetailViewModel {
  PokemonRepository pokemonRepository = GetIt.instance<PokemonRepository>();

  int _pokemonIndex = 0;
  int get pokemonIndex => _pokemonIndex;

  List<PokemonSummary> _pokemonsSummary = [];
  List<PokemonSummary> get pokemonsSummary => _pokemonsSummary;

  PokemonSummary get currentPokemon => _pokemonsSummary[_pokemonIndex];

  bool get previousPokemonEnable => _pokemonIndex > 0;
  bool get nextPokemonEnable => _pokemonIndex < _pokemonsSummary.length - 1;

  final BehaviorSubject<PokemonSummary> _streamPokemonSummary = BehaviorSubject();
  Stream<PokemonSummary> get streamPokemonSummary => _streamPokemonSummary.stream;

  final BehaviorSubject<Pokemon?> _streamPokemon = BehaviorSubject();
  Stream<Pokemon?> get streamPokemon => _streamPokemon.stream;

  final BehaviorSubject<bool> _streamFavoritedPokemon = BehaviorSubject();
  Stream<bool> get streamFavoritedPokemon => _streamFavoritedPokemon.stream;

  final BehaviorSubject<double> _streamAppbarOpacity = BehaviorSubject();
  Stream<double> get streamAppbarOpacity => _streamAppbarOpacity.stream;

  final BehaviorSubject<AudioDurations> _streamAudio = BehaviorSubject();
  Stream<AudioDurations> get streamAudio => _streamAudio.stream;

  final BehaviorSubject<List<MoveState>> _streamMoves = BehaviorSubject();
  Stream<List<MoveState>> get streamMoves => _streamMoves.stream;

  Future<void> initial(int index, List<PokemonSummary> pokemons) async {
    _pokemonsSummary = pokemons;
    await setPokemon(index);
  }

  Future<void> setPokemon(int pokemonIndex) async {
    _pokemonIndex = pokemonIndex;
    _streamPokemonSummary.add(_pokemonsSummary[_pokemonIndex]);
    await resetAudioValue();
    await fetchPokemonDetail();
    await resetMovesValue();
  }

  Future<void> resetAudioValue() async {
    _streamAudio.add(
      AudioDurations(
        total: Duration.zero,
        progress: Duration.zero,
      ),
    );
  }

  Future<void> resetMovesValue() async {
    var pokemon = _streamPokemon.value;
    if (pokemon == null) return;
    _streamMoves.add([
      if (pokemon.moves.levelUp.isNotEmpty)
        MoveState(
          MoveType.levelUp,
          pokemon.moves.levelUp,
          true,
        ),
      if (pokemon.moves.technicalMachine.isNotEmpty)
        MoveState(
          MoveType.technicalMachine,
          pokemon.moves.technicalMachine,
          false,
        ),
      if (pokemon.moves.technicalRecords.isNotEmpty)
        MoveState(
          MoveType.technicalRecords,
          pokemon.moves.technicalRecords,
          false,
        ),
      if (pokemon.moves.evolution.isNotEmpty)
        MoveState(
          MoveType.evolution,
          pokemon.moves.evolution,
          false,
        ),
      if (pokemon.moves.egg.isNotEmpty)
        MoveState(
          MoveType.egg,
          pokemon.moves.egg,
          false,
        ),
      if (pokemon.moves.tutor.isNotEmpty)
        MoveState(
          MoveType.tutor,
          pokemon.moves.tutor,
          false,
        ),
    ]);
  }

  Future<void> fetchPokemonDetail() async {
    String pokemonNumber = _pokemonsSummary[pokemonIndex].number;
    var pokemonsFavorite = await pokemonRepository.fetchPokemonsFavorite();
    _streamFavoritedPokemon.add(pokemonsFavorite.contains(pokemonNumber));
    var pokemonInfo = await pokemonRepository.fetchPokemonDetail(pokemonNumber);
    _streamPokemon.add(pokemonInfo);
  }

  Future<void> onPageChanged(int index) async {
    await setPokemon(index);
  }

  Future<void> onFavorite(bool favorited) async {
    var pokemonsFavorite = await pokemonRepository.fetchPokemonsFavorite();
    var pokemonNumber = _pokemonsSummary[_pokemonIndex].number;
    if (favorited) {
      pokemonsFavorite.add(pokemonNumber);
    } else {
      pokemonsFavorite.remove(pokemonNumber);
    }
    await pokemonRepository.savePokemonsFavorite(pokemonsFavorite);
    _streamFavoritedPokemon.add(favorited);
  }

  Future<void> setOpacityProgress(double progress) async {
    _streamAppbarOpacity.add(progress);
  }

  Future<void> setAudioTotal(Duration total) async {
    _streamAudio.add(
      AudioDurations(
        total: total,
        progress: _streamAudio.value.progress,
      ),
    );
  }

  Future<void> setAudioProgress(Duration progress) async {
    _streamAudio.add(
      AudioDurations(
        total: _streamAudio.value.total,
        progress: progress,
      ),
    );
  }

  Future<void> setMoveExpanded(MoveType type, bool isExpanded) async {
    var currentMoves = _streamMoves.value.orEmpty;
    for (var move in currentMoves) {
      if (move.type == type) {
        move.isExpanded = !isExpanded;
      }
    }
    _streamMoves.add(currentMoves);
  }
}
