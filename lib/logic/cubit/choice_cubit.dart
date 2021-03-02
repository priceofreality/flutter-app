import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/mock.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  static List<MockObject> _testChoices = [
    MockObject(answer: 'Payer directement', value: '-600'),
    MockObject(answer: 'Remettre a plus tard'),
    MockObject(answer: 'taper le proprio')
  ];

  ChoiceCubit() : super(ChoiceState(_testChoices, _testChoices[0]));

  void emitSelectAnswer(MockObject newValue) =>
      emit(ChoiceState(state.all, newValue));
}
