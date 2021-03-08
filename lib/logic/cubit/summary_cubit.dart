import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/choice.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit() : super(SummaryState([], null));
}
