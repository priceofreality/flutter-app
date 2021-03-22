import 'package:equatable/equatable.dart';
import 'package:projet4/data/db/options.dart' as options;

class FinancialSituation extends Equatable {
  final int id;
  final String label;
  final double initialBudget;
  final options.FamilySituation familySituation;
  final options.ProfessionalSituation financialSituation;

  FinancialSituation(
      {required this.id,
      required this.label,
      required this.initialBudget,
      required this.familySituation,
      required this.financialSituation});

  factory FinancialSituation.fromTuple(Map<String, dynamic> tuple) =>
      FinancialSituation(
          id: tuple['id'],
          label: tuple['label'],
          initialBudget: tuple['budget'],
          familySituation:
              options.FamilySituation.values[tuple['familial_situation']],
          financialSituation: options
              .ProfessionalSituation.values[tuple['professional_situation']]);

  @override
  List<Object> get props => [id];
}
