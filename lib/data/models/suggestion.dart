import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Suggestion extends Equatable {
  final int id;
  final String entitled;

  const Suggestion({@required this.id, @required this.entitled});

  @override
  String toString() {
    return "${this.id} : ${this.entitled}";
  }

  @override
  List<Object> get props => [id];
}
