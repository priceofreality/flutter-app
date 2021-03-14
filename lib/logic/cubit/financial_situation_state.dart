part of 'financial_situation_cubit.dart';

class FinancialSituationState {
  final FinancialSituation? financialSituation;
  final List<Transaction> transactions;

  FinancialSituationState(this.financialSituation, this.transactions);
}

class FinancianSituationInitialState extends FinancialSituationState {
  FinancianSituationInitialState() : super(null, []);
}
