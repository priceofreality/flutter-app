import 'package:equatable/equatable.dart';
import 'package:projet4/data/db/options.dart' as options;

class FinancialSituation extends Equatable {
  final int id;
  final String label;
  double budget;
  final options.FamilySituation familySituation;
  final options.ProfessionalSituation financialSituation;

  FinancialSituation(
      {required this.id,
      required this.label,
      required this.budget,
      required this.familySituation,
      required this.financialSituation});

  factory FinancialSituation.fromTuple(Map<String, dynamic> tuple) =>
      FinancialSituation(
          id: tuple['id'],
          label: tuple['label'],
          budget: tuple['budget'],
          familySituation:
              options.FamilySituation.values[tuple['familial_situation']],
          financialSituation: options
              .ProfessionalSituation.values[tuple['financial_situations']]);

  @override
  List<Object> get props => [id];
}
