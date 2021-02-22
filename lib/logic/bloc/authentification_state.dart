part of 'authentification_bloc.dart';

enum _AuthentificationState { Authenticated, Unauthenticated }

abstract class AuthentificationState extends BlocState<_AuthentificationState> {
  const AuthentificationState(_AuthentificationState type) : super(type);

  factory AuthentificationState.authenticated() = AuthentificationAuthenticated;

  factory AuthentificationState.unauthenticated() =
      AuthentificationUnauthenticated;

  // ignore: missing_return
  Widget when(
      {@required Widget authenticated, @required Widget unauthenticated}) {
    switch (type) {
      case _AuthentificationState.Authenticated:
        return authenticated;
      case _AuthentificationState.Unauthenticated:
        return unauthenticated;
    }
  }
}

class AuthentificationAuthenticated extends AuthentificationState {
  final User user;

  const AuthentificationAuthenticated({@required this.user})
      : super(_AuthentificationState.Authenticated);

  @override
  List<Object> get props => [user];
}

class AuthentificationUnauthenticated extends AuthentificationState {
  const AuthentificationUnauthenticated()
      : super(_AuthentificationState.Unauthenticated);

  @override
  List<Object> get props => [];
}
