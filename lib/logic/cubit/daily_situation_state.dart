part of 'daily_situation_cubit.dart';

class DailySituationState extends Equatable {
  final List<DailySituation> dailySituations;

  final DailySituation current;

  DailySituationState(this.dailySituations, this.current);

  @override
  List<Object> get props => [current];
}
