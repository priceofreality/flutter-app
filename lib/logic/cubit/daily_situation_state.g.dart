// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_situation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySituationState _$DailySituationStateFromJson(Map<String, dynamic> json) {
  return DailySituationState(
    (json['dailySituations'] as List<dynamic>)
        .map((e) => DailySituation.fromJson(e as Map<String, dynamic>))
        .toList(),
    DailySituation.fromJson(json['current'] as Map<String, dynamic>),
    json['lastDay'] as int?,
    json['lastDailySituationOfDay'] as int?,
    json['hasRewind'] as bool?,
  );
}

Map<String, dynamic> _$DailySituationStateToJson(
        DailySituationState instance) =>
    <String, dynamic>{
      'dailySituations':
          instance.dailySituations.map((e) => e.toJson()).toList(),
      'current': instance.current.toJson(),
      'lastDay': instance.lastDay,
      'lastDailySituationOfDay': instance.lastDailySituationOfDay,
      'hasRewind': instance.hasRewind,
    };
