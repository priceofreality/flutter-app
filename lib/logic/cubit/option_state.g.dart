// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionState _$OptionStateFromJson(Map<String, dynamic> json) {
  return OptionState(
    (json['options'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList()),
    ),
    (json['miscellaneousSelected'] as List<dynamic>)
        .map((e) => Option.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['groupSelected'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, Option.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$OptionStateToJson(OptionState instance) =>
    <String, dynamic>{
      'options': instance.options
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'miscellaneousSelected':
          instance.miscellaneousSelected.map((e) => e.toJson()).toList(),
      'groupSelected':
          instance.groupSelected.map((k, e) => MapEntry(k, e.toJson())),
    };
