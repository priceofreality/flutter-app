part of 'choice_cubit.dart';

class ChoiceState extends Equatable {
  List<Choice> all;

  Choice current;

  ChoiceState(this.all, this.current);

  @override
  List<Object> get props => [current];
}
