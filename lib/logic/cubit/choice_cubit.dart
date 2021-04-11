import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/choice.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit() : super(ChoiceInitialState());

  void emitChoices(Set<Choice> choices) => emit(ChoiceState(choices, null));

  void emitSelectChoice(Choice newValue) =>
      emit(ChoiceState(state.choices, newValue));

  void emitReset() => emit(ChoiceInitialState());
}
