import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:projet4/logic/state.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription _connectivitySubscription;

  InternetCubit() : super(InternetState.disconnected()) {
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.mobile:
          {
            emitInternetConnection();
          }
          break;
        case ConnectivityResult.wifi:
          {
            emitInternetConnection();
          }
          break;
        default:
          {
            emitInternetDisconnection();
          }
          break;
      }
    });
  }

  void emitInternetConnection() => emit(InternetState.connected());

  void emitInternetDisconnection() => emit(InternetState.disconnected());

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
