import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String id;

  const User({@required this.name, @required this.email, @required this.id});

  bool isEmpty() => id == null;

  @override
  List<Object> get props => [name, email, id];
}
