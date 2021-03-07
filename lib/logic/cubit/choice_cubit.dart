import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  final DailySituationCubit dailySituationCubit;

  ChoiceCubit({required this.dailySituationCubit})
      : super(ChoiceState(dailySituationCubit.state.current.choices, null));

  void emitSelectChoice(Choice newValue) =>
      emit(ChoiceState(state.choices, newValue));
}
