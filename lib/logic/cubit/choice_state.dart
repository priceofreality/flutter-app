part of 'choice_cubit.dart';

class ChoiceState extends Equatable {
  List<MockObject> all;

  MockObject current;

  ChoiceState(this.all, this.current);

  @override
  List<Object> get props => [current];
}
