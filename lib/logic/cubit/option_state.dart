part of 'option_cubit.dart';

class OptionState {
  final Map<OptionGroup, List<Option>> options;
  final List<Option> selected;

  const OptionState(this.options, this.selected);
}

class OptionInitial extends OptionState {
  OptionInitial() : super({}, []);
}
