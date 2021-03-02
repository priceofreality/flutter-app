import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MockObject extends Equatable {
  String answer;
  String value;

  MockObject({@required this.answer, this.value});

  @override
  List<Object> get props => [answer, value];
}
