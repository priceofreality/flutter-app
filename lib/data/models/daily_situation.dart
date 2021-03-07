import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/choice.dart';

class DailySituation extends Equatable {
  final int id;
  final int day;
  final String event;
  final List<Choice> choices;

  const DailySituation(
      {required this.id,
      required this.day,
      required this.event,
      required this.choices});

  factory DailySituation.fromJson(Map<String, dynamic> dailySituationsJson,
      Map<String, dynamic> eventsJson, Map<String, dynamic> choicesJson) {
    final choicesRef = List<int>.from(dailySituationsJson['choices']);

    List<Choice> choices = choicesRef
        .map((e) => Choice.fromJson(choicesJson[e.toString()]!))
        .toList();

    return DailySituation(
        id: dailySituationsJson['id'],
        day: dailySituationsJson['day'],
        event: eventsJson[dailySituationsJson['event'].toString()],
        choices: choices);
  }

  @override
  String toString() {
    return "${this.id} : ${this.day} , ${this.event} => ${this.choices}";
  }

  @override
  List<Object> get props => [id];
}
