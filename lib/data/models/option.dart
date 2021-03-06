import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/option_group_icons.dart';

part 'option.g.dart';

@JsonSerializable(explicitToJson: true)
class Option extends Equatable {
  final int id;
  final String label;
  final OptionGroup optionGroup;
  final List<OptionGroupIcons>? optionGroupIcons;

  Option(
      {required this.id,
      required this.label,
      required this.optionGroup,
      this.optionGroupIcons});

  factory Option.fromTuple(
          Map<String, dynamic> tuple,
          Map<int, OptionGroup> groups,
          Map<int, List<OptionGroupIcons>> optionIcons) =>
      Option(
          id: tuple['id'],
          label: tuple['label'],
          optionGroup: groups[tuple['option_group']]!,
          optionGroupIcons: optionIcons[tuple['id']]);

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);

  @override
  List<Object> get props => [id];
}
