// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return Choice(
    id: json['id'] as int,
    label: json['label'] as String,
    concludes: json['concludes'] as bool,
    minCost: (json['minCost'] as num?)?.toDouble(),
    maxCost: (json['maxCost'] as num?)?.toDouble(),
    unlockDailySituation: (json['unlockDailySituation'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
  );
}

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'concludes': instance.concludes,
      'unlockDailySituation': instance.unlockDailySituation,
      'minCost': instance.minCost,
      'maxCost': instance.maxCost,
    };
