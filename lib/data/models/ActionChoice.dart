import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/data/models/suggestion.dart';

class ActionChoice extends Equatable {
  final String id;
  final int day;
  final Suggestion suggestion;
  final List<Choice> choices;

  const ActionChoice(
      {@required this.id,
      @required this.day,
      @required this.suggestion,
      @required this.choices});

  @override
  List<Object> get props => [id, day, suggestion, choices];
}
