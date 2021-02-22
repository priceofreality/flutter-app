import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projet4/data/models/user.dart';
import 'package:projet4/logic/event.dart';
import 'package:projet4/logic/state.dart';

part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  AuthentificationBloc() : super(null); //TODO

  @override
  Stream<AuthentificationState> mapEventToState(
    AuthentificationEvent event,
  ) async* {
    switch (event.type) {
      case _AuthentificationEvent.UserChanged:
        yield await _mapAuthentificationUserChangedToState(event);
        break;
      case _AuthentificationEvent.Logout:
        break;
    }
  }

  Future<AuthentificationState> _mapAuthentificationUserChangedToState(
      AuthentificationUserChangedEvent event) async {
    return event.user.isEmpty()
        ? AuthentificationState.authenticated()
        : AuthentificationState.unauthenticated();
  }
}
