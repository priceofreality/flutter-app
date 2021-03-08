import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/repositories/game.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';
import 'package:projet4/logic/cubit/financial_situation_cubit.dart';
import 'package:projet4/logic/cubit_state.dart';

part 'daily_situation_event.dart';
part 'daily_situation_state.dart';

class DailySituationBloc
    extends Bloc<DailySituationEvent, DailySituationState> {
  static final GameRepository gameRepository = GameRepository();

  final ChoiceCubit choiceCubit;
  final FinancialSituationCubit financialSituationCubit;

  int _day = 1;
  int _index = 0;

  DailySituationBloc(
      {required this.choiceCubit, required this.financialSituationCubit})
      : super(DailySituationState(gameRepository.dailySituations[1]!,
            gameRepository.dailySituations[1]![0])) {
    choiceCubit.emitNewChoices(gameRepository.dailySituations[1]![0].choices);
  }

  @override
  Stream<DailySituationState> mapEventToState(
    DailySituationEvent event,
  ) async* {
    if (event is DailySituationNextEvent) {
      yield _mapNextEvent();
    } else
      yield D([], null);
  }

  DailySituationState _mapNextEvent() {
    if (++_index >= state.dailySituations.length) {
      _index = 0;
      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null ||
          financialSituationCubit.state.financialSituation.budget <= 0) {
        add(DailySituationFinishEvent());

        return D([], null);
      }

      financialSituationCubit.emitTransaction(
          choiceCubit.state.selected!.cost != null
              ? choiceCubit.state.selected!.cost!
              : 0);

      choiceCubit.emitNewChoices(dailySituations[_index].choices);

      return DailySituationState(dailySituations, dailySituations[_index]);
    }

    financialSituationCubit.emitTransaction(
        choiceCubit.state.selected!.cost != null
            ? choiceCubit.state.selected!.cost!
            : 0);

    return DailySituationState(
        state.dailySituations, state.dailySituations[_index]);
  }

  List<DailySituation>? _getNextDayDailySituations() {
    while (++_day <= gameRepository.maxDay) {
      if (gameRepository.dailySituations.containsKey(_day))
        return gameRepository.dailySituations[_day];
    }

    return null;
  }
}
