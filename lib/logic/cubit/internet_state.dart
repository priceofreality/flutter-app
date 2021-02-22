part of 'internet_cubit.dart';

enum _InternetState { Connected, Disconnected }

abstract class InternetState extends BlocState<_InternetState> {
  const InternetState(_InternetState type) : super(type);

  factory InternetState.connected() = InternetConnected;

  factory InternetState.disconnected() = InternetDisconnected;

  bool isConnected() => type == _InternetState.Connected;

  bool isDisonnected() => type == _InternetState.Disconnected;
}

class InternetConnected extends InternetState {
  const InternetConnected() : super(_InternetState.Connected);

  @override
  List<Object> get props => [];
}

class InternetDisconnected extends InternetState {
  const InternetDisconnected() : super(_InternetState.Disconnected);

  @override
  List<Object> get props => [];
}
