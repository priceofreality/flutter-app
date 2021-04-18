import 'package:bloc/bloc.dart';

class OnboardCubit extends Cubit<bool?> {
  OnboardCubit(bool? firstLoad) : super(firstLoad);

  emitFirstLoad(bool value) => emit(value);
}
