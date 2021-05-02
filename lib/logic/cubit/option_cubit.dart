import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/repositories/game.dart';
import 'package:price_of_reality/logic/cubit/option_state.dart';

class OptionCubit extends Cubit<OptionState> {
  static GameRepository gameRepository = GameRepository();

  OptionCubit() : super(OptionState(gameRepository.optionsPerGroup, [], {})) {
    var options = state.options;
    var selected = state.groupSelected;

    for (Object group in options.keys) {
      group as OptionGroup;

      if (group.id == 1) continue;

      var value = options[group]!;
      selected[group] = value[value.length - 1];
    }

    emit(OptionState(options, state.miscellaneousSelected, selected));
  }

  void emitSelectMiscellaneousOption(bool checked, Option option) {
    List<Option> selected = state.miscellaneousSelected;

    if (checked)
      selected.add(option);
    else
      selected.remove(option);

    emit(OptionState(state.options, selected, state.groupSelected));
  }

  void emitSelectGroupOption(OptionGroup group, Option option) {
    Map<Object, Option> groupSelected = state.groupSelected;

    groupSelected[group] = option;

    emit(
        OptionState(state.options, state.miscellaneousSelected, groupSelected));
  }

  void emitReset() {
    var options = state.options;
    Map<Object, Option> selected = {};

    for (Object group in options.keys) {
      group as OptionGroup;

      if (group.id == 1) continue;

      var value = options[group]!;
      selected[group] = value[value.length - 1];
    }

    emit(OptionState(options, [], selected));
  }

  void emitNewDailySituations() {
    for (Option option in state.miscellaneousSelected)
      gameRepository.unlockDailyOptionSituations(option.id);
    for (Option option in state.groupSelected.values)
      gameRepository.unlockDailyOptionSituations(option.id);
  }

  List<Option> get options {
    var miscellaneous = state.miscellaneousSelected;
    var group = state.groupSelected;
    List<Option> options = [];

    options.addAll(miscellaneous);

    for (Option option in group.values) {
      options.add(option);
    }

    return options;
  }
}
