import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/choice.dart';

part 'choice_state.g.dart';

@JsonSerializable(explicitToJson: true)
class ChoiceState {
  final Set<Choice> choices;

  final Choice? selected;

  final ChoiceRewindState? lastChoiceState;

  ChoiceState(this.choices, this.selected, this.lastChoiceState);

  factory ChoiceState.fromJson(Map<String, dynamic> json) =>
      _$ChoiceStateFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceStateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChoiceRewindState {
  final Set<Choice> choices;

  final Choice? selected;

  ChoiceRewindState(this.choices, this.selected);

  factory ChoiceRewindState.fromJson(Map<String, dynamic> json) =>
      _$ChoiceRewindStateFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceRewindStateToJson(this);
}
