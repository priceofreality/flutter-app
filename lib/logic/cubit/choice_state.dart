part of 'choice_cubit.dart';

class ChoiceState {
  final Set<Choice> choices;

  final Choice? selected;
  final Choice? last;

  ChoiceState(this.choices, this.selected, this.last);
}

class ChoiceInitialState extends ChoiceState {
  ChoiceInitialState() : super({}, null, null);
}
