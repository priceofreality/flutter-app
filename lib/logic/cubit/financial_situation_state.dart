part of 'financial_situation_cubit.dart';

class FinancialSituationState {
  final FinancialSituation? selected;

  /*final Map<FamilySituation, Map<ProfessionalSituation, FinancialSituation>>
      financialSituations;*/

  final FamilySituation? selectedFamilySituation;
  final ProfessionalSituation? selectedProfessionalSituation;

  FinancialSituationState(
      this.selected, //this.financialSituations,
      this.selectedFamilySituation,
      this.selectedProfessionalSituation);
}

class FinancianSituationInitialState extends FinancialSituationState {
  FinancianSituationInitialState() : super(null, null, null);
}
