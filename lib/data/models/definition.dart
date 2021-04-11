import 'package:equatable/equatable.dart';

class Definition extends Equatable {
  final int id;
  final String label;
  final String description;

  Definition(
      {required this.id, required this.label, required this.description});

  factory Definition.fromTuple(Map<String, dynamic> tuple) {
    return Definition(
        id: tuple['id'],
        label: tuple['label'],
        description: tuple['description']);
  }

  @override
  List<Object> get props => [id];
}
