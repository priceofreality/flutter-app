part of 'option_cubit.dart';

class OptionState {
  final Map<OptionGroup, List<Option>> options;
  final List<Option> selected;
  final Map<OptionGroup, Option> groupSelected;

  const OptionState(this.options, this.selected, this.groupSelected);
}

class OptionInitial extends OptionState {
  OptionInitial() : super({}, [], {});
}
