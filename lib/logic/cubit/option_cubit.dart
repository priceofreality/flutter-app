import 'package:bloc/bloc.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/repositories/game.dart';

part 'option_state.dart';

class OptionCubit extends Cubit<OptionState> {
  static GameRepository gameRepository = GameRepository();

  OptionCubit() : super(OptionState(gameRepository.optionsPerGroup, []));

  void emitSelectOption(bool checked, Option option) {
    List<Option> selected = state.selected;

    if (checked)
      selected.add(option);
    else
      selected.remove(option);

    emit(OptionState(state.options, selected));
  }

  void emitReset() => emit(OptionState(gameRepository.optionsPerGroup, []));

  void emitDailySituations() {
    for (Option option in state.selected)
      gameRepository.unlockDailyOptionSituations(option.id);
  }
}
