part of 'financial_situation_cubit.dart';

class FinancialSituationState extends Equatable {
  late FinancialSituation financialSituation;

  FinancialSituationState(this.financialSituation);

  FinancialSituationState.initial();

  @override
  List<Object> get props => [financialSituation];
}

class FinancianSituationInitialState extends FinancialSituationState {
  FinancianSituationInitialState() : super.initial();
}
