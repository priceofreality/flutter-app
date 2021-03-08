import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String label;
  final double? cost;

  const Choice({required this.id, required this.label, this.cost});

  factory Choice.fromJson(int id, Map<String, dynamic> json) =>
      json.containsKey('cost')
          ? Choice(
              id: id,
              label: json['label'],
              cost: json['cost'],
            )
          : Choice(
              id: id,
              label: json['label'],
            );

  @override
  String toString() {
    return "${this.label}, ${this.cost}";
  }

  @override
  List<Object> get props => [label, cost ?? 0.0];
}
