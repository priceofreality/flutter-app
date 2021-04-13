import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final int id;
  final String label;

  Group({required this.id, required this.label});

  factory Group.fromTuple(Map<String, dynamic> tuple) {
    return Group(id: tuple['id'], label: tuple['label']);
  }

  @override
  List<Object> get props => [id];
}
