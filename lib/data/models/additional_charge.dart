import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/db/options.dart';

class AdditionalCharge extends Equatable {
  final int id;
  final double charge;
  final Option option;

  const AdditionalCharge(
      {required this.id, required this.charge, required this.option});

  factory AdditionalCharge.fromTuple(Map<String, dynamic> tuple) =>
      AdditionalCharge(
          id: tuple['id'],
          charge: tuple['additional_charge'],
          option: Option.values[tuple['option']]);

  @override
  List<Object?> get props => [id];
}
