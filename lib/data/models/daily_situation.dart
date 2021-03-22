import 'package:equatable/equatable.dart';

class DailySituation extends Equatable {
  final int id;
  final int day;
  final String event;
  final bool locked;

  const DailySituation(
      {required this.id,
      required this.day,
      required this.event,
      required this.locked});

  factory DailySituation.fromTuple(
          Map<String, dynamic> tuple, Map<int, String> events) =>
      DailySituation(
          id: tuple['id'],
          day: tuple['day'],
          event: events[tuple['event']]!,
          locked: tuple['locked'] == 1);

  @override
  List<Object> get props => [id];
}
