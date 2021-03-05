import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String choice;
  final double budget;

  const Choice(
      {required this.id, required this.choice, required this.budget});

  @override
  String toString() {
    return "${this.id} : ${this.choice}, ${this.budget}";
  }

  @override
  List<Object> get props => [id];
}
