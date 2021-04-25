// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    day: json['day'] as int,
    event: json['event'] as String,
    choice: json['choice'] as String,
    cost: (json['cost'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'day': instance.day,
      'event': instance.event,
      'choice': instance.choice,
      'cost': instance.cost,
    };
