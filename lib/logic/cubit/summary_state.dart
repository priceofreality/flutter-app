part of 'summary_cubit.dart';

class SummaryState extends Equatable {
  final List<Choice> choices;

  final Choice? selected;

  final endGame = false;

  SummaryState(this.choices, this.selected);

  @override
  List<Object> get props => [selected ?? ''];
}
