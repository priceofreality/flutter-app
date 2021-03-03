import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/logic/cubit/action_choice_cubit.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  final ActionChoiceCubit actionChoiceCubit;

  ChoiceCubit({@required this.actionChoiceCubit})
      : super(ChoiceState(actionChoiceCubit.state.current.choices,
            actionChoiceCubit.state.current.choices[0]));

  void emitSelectAnswer(Choice newValue) =>
      emit(ChoiceState(state.all, newValue));
}
