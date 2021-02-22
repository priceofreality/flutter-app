import 'package:equatable/equatable.dart';

abstract class BlocState<T> extends Equatable {
  final T _type;

  const BlocState(this._type);

  T get type => _type;

  @override
  List<Object> get props => [_type];
}
