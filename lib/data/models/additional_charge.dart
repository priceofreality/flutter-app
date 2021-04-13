import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/option.dart';

class AdditionalCharge extends Equatable {
  final Option option;
  final Choice choice;
  final double charge;

  const AdditionalCharge(
      {required this.charge, required this.option, required this.choice});

  factory AdditionalCharge.fromTuple(Map<String, dynamic> tuple,
          Map<int, Option> options, Map<int, Choice> dailySituationChoices) =>
      AdditionalCharge(
          charge: tuple['charge'],
          option: options[tuple['option']]!,
          choice: dailySituationChoices[tuple['daily_situation_choice']]!);

  @override
  List<Object?> get props => [option, charge, choice];
}
