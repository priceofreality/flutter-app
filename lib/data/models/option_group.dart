import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_group.g.dart';

@JsonSerializable()
class OptionGroup extends Equatable {
  final int id;
  final String label;

  OptionGroup({required this.id, required this.label});

  factory OptionGroup.fromTuple(Map<String, dynamic> tuple) =>
      OptionGroup(id: tuple['id'], label: tuple['label']);

  factory OptionGroup.fromJson(Map<String, dynamic> json) =>
      _$OptionGroupFromJson(json);

  Map<String, dynamic> toJson() => _$OptionGroupToJson(this);

  @override
  List<Object> get props => [id];
}
