import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  final int day;
  final String event;
  final String choice;
  final double cost;

  Transaction(
      {required this.day,
      required this.event,
      required this.choice,
      required this.cost});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  List<Object?> get props => [day, event, choice, cost];
}
