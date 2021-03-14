import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/choice.dart';

class DailySituation extends Equatable {
  final int id;
  final int day;
  final String event;
  final List<Choice> choices;
  final bool locked;

  const DailySituation(
      {required this.id,
      required this.day,
      required this.event,
      required this.choices,
      required this.locked});

  factory DailySituation.fromTuple(Map<String, dynamic> dailySituationsTuple, List allEvents, List<Choice> allChoices) {
    final choicesRef = List<int>.from(dailySituationsTuple['choices']);        
    
    List<Choice> choices = [];
    for(int i in choicesRef){
      choices.add(allChoices[i]);
    }

    return DailySituation(
        id: dailySituationsTuple['id'],
        day: dailySituationsTuple['day'],
        event: allEvents[dailySituationsTuple['event']],
        choices: choices,
        locked: dailySituationsTuple['locked']);
  }

  @override
  String toString() {
    return "${this.id} : ${this.day} , ${this.event} => ${this.choices}";
  }

  @override
  List<Object> get props => [id];
}
