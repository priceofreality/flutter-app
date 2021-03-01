import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void emitIncrement() => emit(state + 1);

  void emitDecrement() => emit(state - 1);
}
