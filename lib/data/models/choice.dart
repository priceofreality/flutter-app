import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final String id;
  final String choice;
  final double budget;

  const Choice(
      {@required this.id, @required this.choice, @required this.budget});

  @override
  List<Object> get props => [id, choice, budget];
}
