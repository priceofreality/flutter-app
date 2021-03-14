import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [day, event, choice, cost];
}
