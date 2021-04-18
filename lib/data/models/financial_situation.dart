import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/db/situations_options.dart' as options;

class FinancialSituation extends Equatable {
  final int id;
  final String label;
  final double initialBudget;
  final options.FamilySituation familySituation;
  final options.ProfessionalSituation professionalSituation;

  FinancialSituation(
      {required this.id,
      required this.label,
      required this.initialBudget,
      required this.familySituation,
      required this.professionalSituation});

  factory FinancialSituation.fromTuple(Map<String, dynamic> tuple) =>
      FinancialSituation(
          id: tuple['id'],
          label: tuple['label'],
          initialBudget: tuple['budget'],
          familySituation:
              options.FamilySituation.values[tuple['family_situation']],
          professionalSituation: options
              .ProfessionalSituation.values[tuple['professional_situation']]);

  @override
  List<Object> get props => [id];
}
