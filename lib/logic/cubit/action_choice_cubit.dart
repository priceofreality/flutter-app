import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projet4/data/models/ActionChoice.dart';
import 'package:projet4/data/repositories/action.dart';

part 'action_choice_state.dart';

class ActionChoiceCubit extends Cubit<ActionChoiceState> {
  final ActionRepository actionRepository;

  ActionChoiceCubit({@required this.actionRepository})
      : super(ActionChoiceState(
            actionRepository.getActions(0), actionRepository.getActions(0)[0]));

  void emitSelectAnswer(ActionChoice newValue) =>
      emit(ActionChoiceState(state.all, newValue));
}
