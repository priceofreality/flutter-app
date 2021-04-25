import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/situations_options.dart';

part 'financial_situation.g.dart';

@JsonSerializable()
class FinancialSituation extends Equatable {
  final int id;
  final String label;
  final double initialBudget;
  final FamilySituation familySituation;
  final ProfessionalSituation professionalSituation;

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
          familySituation: FamilySituation.values[tuple['family_situation']],
          professionalSituation:
              ProfessionalSituation.values[tuple['professional_situation']]);

  factory FinancialSituation.fromJson(Map<String, dynamic> json) =>
      _$FinancialSituationFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialSituationToJson(this);

  @override
  List<Object> get props => [id];
}
