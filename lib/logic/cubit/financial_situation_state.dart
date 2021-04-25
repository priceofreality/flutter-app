import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/situations_options.dart';

part 'financial_situation_state.g.dart';

@JsonSerializable(explicitToJson: true)
class FinancialSituationState {
  Map<FamilySituation, Map<ProfessionalSituation, FinancialSituation>>
      financialSituations;

  final FinancialSituation? selected;

  final FamilySituation? selectedFamilySituation;
  final ProfessionalSituation? selectedProfessionalSituation;

  FinancialSituationState(this.financialSituations, this.selected,
      this.selectedFamilySituation, this.selectedProfessionalSituation);

  factory FinancialSituationState.fromJson(Map<String, dynamic> json) =>
      _$FinancialSituationStateFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialSituationStateToJson(this);
}
