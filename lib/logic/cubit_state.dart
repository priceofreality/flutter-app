import 'package:equatable/equatable.dart';

abstract class BlocState<T> extends Equatable {
  T type;

  BlocState(this.type);
}
