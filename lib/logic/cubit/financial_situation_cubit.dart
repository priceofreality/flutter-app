import 'package:bloc/bloc.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/situations_options.dart';
import 'package:price_of_reality/data/repositories/game.dart';

part 'financial_situation_state.dart';

class FinancialSituationCubit extends Cubit<FinancialSituationState> {
  static final GameRepository gameRepository = GameRepository();

  FinancialSituationCubit() : super(FinancianSituationInitialState());

/*  void emitFinancialSituation(FinancialSituation financialSituation) =>
      emit(FinancialSituationState(financialSituation, {}, null, null));
*/
  /* void emitSelectFinancialSituation(FinancialSituation financialSituation) =>
      emit(FinancialSituationState(
          financialSituation, state.financialSituations));*/

  Map<FamilySituation, Map<ProfessionalSituation, FinancialSituation>>
      get financialSituations => gameRepository.financialSituations;

  emitReset() => emit(FinancianSituationInitialState());

  void emitNewDailySituations() {
    gameRepository.unlockDailyFinancialSituations(state.selected!.id);
  }

  void emitFamilySituation(FamilySituation familySituation) =>
      emit(FinancialSituationState(null, familySituation, null));

  void emitProfessionalSituation(ProfessionalSituation professionalSituation) {
    var financialSituation = financialSituations[
        state.selectedFamilySituation]![professionalSituation];

    emit(FinancialSituationState(financialSituation,
        state.selectedFamilySituation, professionalSituation));
  }

  List<FamilySituation> get familySituations =>
      financialSituations.keys.toList();

  List<ProfessionalSituation> professionalSituations(
          FamilySituation familySituation) =>
      financialSituations[familySituation]!.keys.toList();
}
