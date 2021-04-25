// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChoiceState _$ChoiceStateFromJson(Map<String, dynamic> json) {
  return ChoiceState(
    (json['choices'] as List<dynamic>)
        .map((e) => Choice.fromJson(e as Map<String, dynamic>))
        .toSet(),
    json['selected'] == null
        ? null
        : Choice.fromJson(json['selected'] as Map<String, dynamic>),
    json['lastChoiceState'] == null
        ? null
        : ChoiceRewindState.fromJson(
            json['lastChoiceState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChoiceStateToJson(ChoiceState instance) =>
    <String, dynamic>{
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'selected': instance.selected?.toJson(),
      'lastChoiceState': instance.lastChoiceState?.toJson(),
    };

ChoiceRewindState _$ChoiceRewindStateFromJson(Map<String, dynamic> json) {
  return ChoiceRewindState(
    (json['choices'] as List<dynamic>)
        .map((e) => Choice.fromJson(e as Map<String, dynamic>))
        .toSet(),
    json['selected'] == null
        ? null
        : Choice.fromJson(json['selected'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChoiceRewindStateToJson(ChoiceRewindState instance) =>
    <String, dynamic>{
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'selected': instance.selected?.toJson(),
    };
