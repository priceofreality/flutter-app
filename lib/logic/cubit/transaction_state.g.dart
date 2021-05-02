// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionState _$TransactionStateFromJson(Map<String, dynamic> json) {
  return TransactionState(
    (json['budget'] as num).toDouble(),
    (json['currentCost'] as num).toDouble(),
    (json['transactions'] as List<dynamic>)
        .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['lastTransactionState'] == null
        ? null
        : TransactionRewindState.fromJson(
            json['lastTransactionState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionStateToJson(TransactionState instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'currentCost': instance.currentCost,
      'lastTransactionState': instance.lastTransactionState?.toJson(),
      'transactions': instance.transactions.map((e) => e.toJson()).toList(),
    };

TransactionRewindState _$TransactionRewindStateFromJson(
    Map<String, dynamic> json) {
  return TransactionRewindState(
    (json['budget'] as num).toDouble(),
    (json['currentCost'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TransactionRewindStateToJson(
        TransactionRewindState instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'currentCost': instance.currentCost,
    };
