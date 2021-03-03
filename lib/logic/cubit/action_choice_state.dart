part of 'action_choice_cubit.dart';

class ActionChoiceState extends Equatable {
  List<ActionChoice> all;

  ActionChoice current;

  ActionChoiceState(this.all, this.current);

  @override
  List<Object> get props => [current];
}
