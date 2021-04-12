import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/group.dart';

class Option extends Equatable {
  final int id;
  final String label;
  final Group? group;

  Option({required this.id, required this.label, this.group});

  factory Option.fromTuple(Map<String, dynamic> tuple, Map<int, Group> groups) {
    return Option(
        id: tuple['id'],
        label: tuple['label'],
        group: (tuple['group'] != null) ? groups[tuple['group']] : null);
  }

  @override
  List<Object> get props => [id];
}
