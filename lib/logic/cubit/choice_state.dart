part of 'choice_cubit.dart';

class ChoiceState extends Equatable {
  final List<Choice> choices;

  final Choice? selected;

  ChoiceState(this.choices, this.selected);

  @override
  List<Object> get props => [selected ?? ''];
}
