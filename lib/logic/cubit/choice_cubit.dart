import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/logic/cubit/choice_state.dart';

class ChoiceCubit extends HydratedCubit<ChoiceState> {
  ChoiceCubit() : super(ChoiceState({}, null, null));

  void emitChoices(Set<Choice> choices) {
    final last = ChoiceRewindState(state.choices, state.selected);

    emit(ChoiceState(choices, null, last));
  }

  void emitSelectChoice(Choice newValue) =>
      emit(ChoiceState(state.choices, newValue, state.lastChoiceState));

  void emitReset() => emit(ChoiceState({}, null, null));

  void emitRewind() {
    final last = state.lastChoiceState!;

    emit(ChoiceState(last.choices, null, null));
  }

  @override
  ChoiceState? fromJson(Map<String, dynamic> json) =>
      ChoiceState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ChoiceState state) => state.toJson();
}
