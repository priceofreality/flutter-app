part of 'option_cubit.dart';

class OptionState extends Equatable {
  final Map<OptionGroup, List<Option>> options;
  final List<Option> selected;

  const OptionState(this.options, this.selected);

  @override
  List<Object> get props => [options, selected];
}

class OptionInitial extends OptionState {
  OptionInitial() : super({}, []);
}
