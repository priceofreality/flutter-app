part of 'daily_situation_cubit.dart';

class DailySituationState extends Equatable {
  late final List<DailySituation> dailySituations;

  late final DailySituation current;

  DailySituationState(this.dailySituations, this.current);

  DailySituationState.finish();

  @override
  List<Object> get props => [current];
}

class DailySituationFinishedState extends DailySituationState {
  DailySituationFinishedState() : super.finish();
}
