import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/financial_situation.dart';
import 'package:projet4/data/repositories/game.dart';

part 'financial_situation_state.dart';

class FinancialSituationCubit extends Cubit<FinancialSituationState> {
  static final GameRepository gameRepository = GameRepository();

  FinancialSituationCubit()
      : super(FinancialSituationState(FinancialSituation.clone(
            financialSituation: gameRepository.financialSituations[0])));

  void emitTransaction(double cost) {
    FinancialSituation situation = state.financialSituation;

    situation.budget += cost;

    emit(FinancialSituationState(situation));
  }

  void emitReset() {
    emit(FinancianSituationInitialState());
    emit(FinancialSituationState(FinancialSituation.clone(
        financialSituation: gameRepository.financialSituations[0])));
  }
}
