import 'package:equatable/equatable.dart';

class OptionSituation extends Equatable {
  final int id;
  final String label;

  const OptionSituation({required this.id, required this.label});

  factory OptionSituation.fromTuple(Map<String, dynamic> tuple) =>
      OptionSituation(id: tuple['id'], label: tuple['label']);

  @override
  List<Object?> get props => [id];
}
