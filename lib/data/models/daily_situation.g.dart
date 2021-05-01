// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_situation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySituation _$DailySituationFromJson(Map<String, dynamic> json) {
  return DailySituation(
      id: json['id'] as int,
      day: json['day'] as int,
      event: json['event'] as String,
      locked: json['locked'] as bool,
      endOfMonth: json['end_of_month'] as bool);
}

Map<String, dynamic> _$DailySituationToJson(DailySituation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'event': instance.event,
      'locked': instance.locked,
      'endOfMonth': instance.endOfMonth
    };
