import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';

part 'daily_situation_state.g.dart';

@JsonSerializable(explicitToJson: true)
class DailySituationState {
  late final List<DailySituation> dailySituations;

  late final DailySituation current;

  late final int? lastDay;
  late final int? lastDailySituationOfDay;
  late final bool? hasRewind;

  DailySituationState(this.dailySituations, this.current, this.lastDay,
      this.lastDailySituationOfDay, this.hasRewind);

  DailySituationState.finish();

  factory DailySituationState.fromJson(Map<String, dynamic> json) =>
      _$DailySituationStateFromJson(json);

  Map<String, dynamic> toJson() => _$DailySituationStateToJson(this);
}

class DailySituationFinishedState extends DailySituationState {
  DailySituationFinishedState() : super.finish();
}
