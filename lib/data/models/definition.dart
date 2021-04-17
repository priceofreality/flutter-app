import 'package:equatable/equatable.dart';

class Definition extends Equatable {
  final int id;
  final String label;
  final String definition;

  Definition({required this.id, required this.label, required this.definition});

  factory Definition.fromTuple(Map<String, dynamic> tuple) {
    return Definition(
        id: tuple['id'],
        label: tuple['label'],
        definition: tuple['definition']);
  }

  @override
  List<Object> get props => [id];
}
