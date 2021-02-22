import 'package:equatable/equatable.dart';

abstract class BlocEvent<T> extends Equatable {
  final T _type;

  const BlocEvent(this._type);

  T get type => _type;

  @override
  List<Object> get props => [_type];
}
