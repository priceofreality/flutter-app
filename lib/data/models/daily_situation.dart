import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_situation.g.dart';

@JsonSerializable()
class DailySituation extends Equatable {
  final int id;
  final int day;
  final String event;
  final bool locked;
  final bool end_of_month;

  const DailySituation(
      {required this.id,
      required this.day,
      required this.event,
      required this.locked,
      required this.end_of_month});

  factory DailySituation.fromTuple(
          Map<String, dynamic> tuple, Map<int, String> events) =>
      DailySituation(
          id: tuple['id'],
          day: tuple['day'],
          event: events[tuple['event']]!,
          locked: tuple['locked'] == 1,
          end_of_month: tuple['end_of_month'] == 1);

  factory DailySituation.fromJson(Map<String, dynamic> json) =>
      _$DailySituationFromJson(json);

  Map<String, dynamic> toJson() => _$DailySituationToJson(this);

  @override
  List<Object> get props => [id];
}
