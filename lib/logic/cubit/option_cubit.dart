import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/repositories/game.dart';

part 'option_state.dart';

class OptionCubit extends Cubit<OptionState> {
  static GameRepository gameRepository = GameRepository();

  OptionCubit() : super(OptionState(gameRepository.getOptionsPerGroup(), []));
  /*
  void emitOptions() {
    print(gameRepository.getOptions());
    emit(OptionState(gameRepository.getOptions(), []));
  }*/

  void emitSelectOption(int optionGroupId, Option option) {
    List<Option> selected = state.selected;

    selected.add(option);

    emit(OptionState(state.options, selected));
  }

  void emitReset() =>
      emit(OptionState(gameRepository.getOptionsPerGroup(), []));

  void emitDailySituations() {
    for (Option option in state.selected)
      gameRepository.unlockDailyOptionSituations(option.id);
  }
}
