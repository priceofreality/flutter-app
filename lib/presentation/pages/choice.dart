import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/data/repositories/action.dart';
import 'package:projet4/logic/cubit/action_choice_cubit.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';

class ChoicePage extends StatelessWidget {
  final ActionChoiceCubit actionChoiceCubit =
      ActionChoiceCubit(actionRepository: ActionRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Container() /*SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => actionChoiceCubit,
            ),
            BlocProvider(
              create: (_) => ChoiceCubit(actionChoiceCubit: actionChoiceCubit),
            ),
          ],
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Suggestion(),
                Answers(),
                ChoiceNextButton(),
              ],
            ),
          ),
        ),
      ),*/
        );
  }
}

class Suggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionChoiceCubit, ActionChoiceState>(
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
              state.current.suggestion.entitled,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
        ],
      );
    });
  }
}

class Answers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiceCubit, ChoiceState>(
      builder: (context, state) {
        return Column(
          children: state.all
              .map(
                (choice) => Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: choice == state.current
                        ? Colors.blue[100]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 2,
                      color: choice == state.current
                          ? Theme.of(context).accentColor
                          : Colors.blue[100]!,
                    ),
                  ),
                  child: RadioListTile<Choice>(
                    title: Text(choice.choice),
                    secondary: Text(choice.budget as String? ?? ''),
                    value: choice,
                    groupValue: state.current,
                    onChanged: (newValue) =>
                        context.read<ChoiceCubit>().emitSelectAnswer(newValue!),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class ChoiceNextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.0),
      alignment: Alignment.bottomCenter,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
        shape: StadiumBorder(),
        color: Theme.of(context).accentColor,
        onPressed: () {},
        child: Text(
          'NEXT'.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
