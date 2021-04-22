part of 'financial_situation_cubit.dart';

class FinancialSituationState {
  Map<FamilySituation, Map<ProfessionalSituation, FinancialSituation>>
      financialSituations;

  final FinancialSituation? selected;

  final FamilySituation? selectedFamilySituation;
  final ProfessionalSituation? selectedProfessionalSituation;

  FinancialSituationState(this.financialSituations, this.selected,
      this.selectedFamilySituation, this.selectedProfessionalSituation);
}

class FinancianSituationInitialState extends FinancialSituationState {
  FinancianSituationInitialState() : super({}, null, null, null);
}
