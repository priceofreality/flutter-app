part of 'daily_situation_cubit.dart';

enum DailySituationStateType { Running, Finished }

class DailySituationState extends BlocState<DailySituationStateType> {
  late final List<DailySituation> dailySituations;

  late final DailySituation current;

  DailySituationState(this.dailySituations, this.current)
      : super(DailySituationStateType.Running);

  DailySituationState.finish() : super(DailySituationStateType.Finished);

  @override
  List<Object> get props => [current];
}

class DailySituationFinishedState extends DailySituationState {
  DailySituationFinishedState() : super.finish();
}
