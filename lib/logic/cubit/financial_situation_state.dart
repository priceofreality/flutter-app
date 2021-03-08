part of 'financial_situation_cubit.dart';

class FinancialSituationState extends Equatable {
  final FinancialSituation financialSituation;

  const FinancialSituationState(this.financialSituation);

  @override
  List<Object> get props => [financialSituation];
}
