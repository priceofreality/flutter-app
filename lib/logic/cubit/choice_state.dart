part of 'choice_cubit.dart';

class ChoiceState extends Equatable {
  final List<Choice> choices;

  final Choice? selected;

  ChoiceState(this.choices, this.selected);

  @override
  List<Object> get props => [selected ?? '', choices];
}

class ChoiceInitialState extends ChoiceState {
  ChoiceInitialState() : super([], null);
}

//build cost
class tmp {
  double initial = 0;
  int status = 0;

  double cost(
      double initialCost, List<int> bitmasks, List<double> additionalCosts) {
    assert(bitmasks.length == additionalCosts.length);

    for (int i = 0; i < bitmasks.length; i++) {
      if (status & bitmasks[i] == bitmasks[i]) {
        initialCost += additionalCosts[i];
      }
    }

    return initialCost;
  }
}
