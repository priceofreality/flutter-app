part of 'daily_situation_bloc.dart';

abstract class DailySituationEvent extends Equatable {
  const DailySituationEvent();

  @override
  List<Object> get props => [];
}

class DailySituationNextEvent extends DailySituationEvent {}

class DailySituationFinishEvent extends DailySituationEvent {}
