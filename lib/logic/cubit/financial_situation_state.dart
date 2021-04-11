part of 'financial_situation_cubit.dart';

class FinancialSituationState {
  final FinancialSituation? selected;

  final List<FinancialSituation> financialSituations;

  FinancialSituationState(this.selected, this.financialSituations);
}

class FinancianSituationInitialState extends FinancialSituationState {
  FinancianSituationInitialState() : super(null, []);
}
