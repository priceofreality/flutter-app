import 'package:bloc/bloc.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/repositories/game.dart';

part 'financial_situation_state.dart';

class FinancialSituationCubit extends Cubit<FinancialSituationState> {
  static final GameRepository gameRepository = GameRepository();

  FinancialSituationCubit() : super(FinancianSituationInitialState());

  void emitFinancialSituation(FinancialSituation financialSituation) =>
      emit(FinancialSituationState(financialSituation, []));

  void emitSelectFinancialSituation(FinancialSituation financialSituation) =>
      emit(FinancialSituationState(
          financialSituation, state.financialSituations));

  List<FinancialSituation> get financialSituations =>
      gameRepository.financialSituations;

  emitReset() => emit(FinancianSituationInitialState());
}
