import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/data/models/mock.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => ChoiceCubit(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('DAY 1'), Text('BUDGET: 0')],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Text(
                    'Vous devez payer le loyer du mois stp',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ),
                Answers(),
                Container(
                  margin: EdgeInsets.only(bottom: 9.0),
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
                    shape: StadiumBorder(),
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                    child: Text(
                      'NEXT'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                (mock) => Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color:
                        mock == state.current ? Colors.blue[100] : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 2,
                      color: mock == state.current
                          ? Theme.of(context).accentColor
                          : Colors.blue[100],
                    ),
                  ),
                  child: RadioListTile<MockObject>(
                    title: Text(mock.answer),
                    secondary: Text(mock.value ?? ''),
                    value: mock,
                    groupValue: state.current,
                    onChanged: (newValue) =>
                        context.read<ChoiceCubit>().emitSelectAnswer(newValue),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
