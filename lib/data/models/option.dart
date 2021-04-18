import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/option_group.dart';

class Option extends Equatable {
  final int id;
  final String label;
  final OptionGroup optionGroup;

  Option({required this.id, required this.label, required this.optionGroup});

  factory Option.fromTuple(
      Map<String, dynamic> tuple, Map<int, OptionGroup> groups) {
    print(tuple['option_group']);
    print(groups);
    print(groups[tuple['option_group']]);
    return Option(
        id: tuple['id'],
        label: tuple['label'],
        optionGroup: groups[tuple['option_group']]!);
  }

  @override
  List<Object> get props => [id];
}
