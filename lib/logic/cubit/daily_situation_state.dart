part of 'daily_situation_cubit.dart';

class DailySituationState extends Equatable {
  late final List<DailySituation> dailySituations;

  late final DailySituation current;
  late final DailySituation? last;

  DailySituationState(this.dailySituations, this.current, this.last);

  DailySituationState.finish();

  @override
  List<Object> get props => [current];
}

class DailySituationFinishedState extends DailySituationState {
  DailySituationFinishedState() : super.finish();
}
