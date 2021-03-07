import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';

class DailySituationPage extends StatelessWidget {
  // ignore: close_sinks
  final DailySituationCubit dailySituationCubit = DailySituationCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => dailySituationCubit,
            ),
            BlocProvider(
              create: (_) =>
                  ChoiceCubit(dailySituationCubit: dailySituationCubit),
            ),
          ],
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Event(),
                Choices(),
                NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailySituationCubit, DailySituationState>(
        builder: (context, state) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('DAY ${state.current.day}'), Text('BUDGET: 0')],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Text(
              state.current.event,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
        ],
      );
    });
  }
}

class Choices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiceCubit, ChoiceState>(
      builder: (context, state) {
        return Column(
          children: state.choices
              .map(
                (choice) => Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: choice == state.selected
                        ? Colors.blue[100]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 2,
                      color: choice == state.selected
                          ? Theme.of(context).accentColor
                          : Colors.blue[100]!,
                    ),
                  ),
                  child: RadioListTile<Choice>(
                    title: Text(choice.label),
                    secondary: Text('${choice.cost ?? ''}'),
                    value: choice,
                    groupValue: state.selected,
                    onChanged: (newValue) =>
                        context.read<ChoiceCubit>().emitSelectChoice(newValue!),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.0),
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
          shape: StadiumBorder(),
          primary: Theme.of(context).accentColor,
        ),
        onPressed: () {},
        child: Text(
          'NEXT'.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
