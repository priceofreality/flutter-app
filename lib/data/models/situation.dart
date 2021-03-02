import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Situation extends Equatable {
  final String id;
  final String entitled;
  final double budget;

  const Situation(
      {@required this.id, @required this.entitled, @required this.budget});

  @override
  List<Object> get props => [id, entitled, budget];
}
