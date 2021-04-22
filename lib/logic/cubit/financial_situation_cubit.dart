import 'package:bloc/bloc.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/situations_options.dart';
import 'package:price_of_reality/data/repositories/game.dart';

part 'financial_situation_state.dart';

class FinancialSituationCubit extends Cubit<FinancialSituationState> {
  static final GameRepository gameRepository = GameRepository();

  FinancialSituationCubit()
      : super(FinancialSituationState(
            gameRepository.financialSituations, null, null, null));

  emitReset() => emit(FinancialSituationState(
      gameRepository.financialSituations, null, null, null));

  void emitNewDailySituations() {
    gameRepository.unlockDailyFinancialSituations(state.selected!.id);
  }

  void emitFamilySituation(FamilySituation familySituation) =>
      emit(FinancialSituationState(
          state.financialSituations, null, familySituation, null));

  void emitProfessionalSituation(ProfessionalSituation professionalSituation) {
    var financialSituation = state.financialSituations[
        state.selectedFamilySituation]![professionalSituation];

    emit(FinancialSituationState(state.financialSituations, financialSituation,
        state.selectedFamilySituation, professionalSituation));
  }

  List<FamilySituation> get familySituations =>
      state.financialSituations.keys.toList();

  List<ProfessionalSituation> professionalSituations(
          FamilySituation familySituation) =>
      state.financialSituations[familySituation]!.keys.toList();
}
