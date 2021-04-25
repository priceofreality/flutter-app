import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/option.dart';

part 'option_state.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionState {
  final Map<Object, List<Option>> options;
  final List<Option> miscellaneousSelected;
  final Map<Object, Option> groupSelected;

  const OptionState(
      this.options, this.miscellaneousSelected, this.groupSelected);

  factory OptionState.fromJson(Map<String, dynamic> json) =>
      _$OptionStateFromJson(json);

  Map<String, dynamic> toJson() => _$OptionStateToJson(this);
}
