part of 'authentification_bloc.dart';

enum _AuthentificationEvent { UserChanged, Logout }

abstract class AuthentificationEvent extends BlocEvent<_AuthentificationEvent> {
  const AuthentificationEvent(_AuthentificationEvent _type) : super(_type);

  factory AuthentificationEvent.logout() = AuthentificationLogoutEvent;

  factory AuthentificationEvent.userChanged() =
      AuthentificationUserChangedEvent;
}

class AuthentificationUserChangedEvent extends AuthentificationEvent {
  final User user;

  const AuthentificationUserChangedEvent({@required this.user})
      : super(_AuthentificationEvent.UserChanged);

  @override
  List<Object> get props => [user];
}

class AuthentificationLogoutEvent extends AuthentificationEvent {
  const AuthentificationLogoutEvent() : super(_AuthentificationEvent.Logout);

  @override
  List<Object> get props => [];
}
