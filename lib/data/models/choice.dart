import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final String label;
  final double? cost;

  const Choice({required this.label, this.cost});

  factory Choice.fromJson(Map<String, dynamic> json) => json.containsKey('cost')
      ? Choice(
          label: json['label'],
          cost: json['cost'],
        )
      : Choice(
          label: json['label'],
        );

  @override
  String toString() {
    return "${this.label}, ${this.cost}";
  }

  @override
  List<Object> get props => [label, cost ?? 0.0];
}
