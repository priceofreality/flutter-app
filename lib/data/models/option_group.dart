import 'package:equatable/equatable.dart';

class OptionGroup extends Equatable {
  final int id;
  final String label;

  OptionGroup({required this.id, required this.label});

  factory OptionGroup.fromTuple(Map<String, dynamic> tuple) =>
      OptionGroup(id: tuple['id'], label: tuple['label']);

  @override
  List<Object> get props => [id];
}
