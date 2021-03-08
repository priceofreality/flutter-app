import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';
import 'package:projet4/logic/cubit/financial_situation_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projet4/presentation/widgets/custom_radio_button.dart';

class DailySituationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            children: [
              Text(AppLocalizations.of(context)!.day + ' ${state.current.day}'),
              Budget()
            ],
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

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancialSituationCubit, FinancialSituationState>(
        builder: (context, state) {
      return Text(AppLocalizations.of(context)!.budget +
          ': ${state.financialSituation.budget}');
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
                        ? Color(0xff5390d9)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 2,
                      color: Color(0xff5390d9),
                    ),
                  ),
                  child: CustomRadioListTile<Choice>(
                    title: Padding(
                      child: Text(
                        choice.label,
                        style: choice == state.selected
                            ? Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.white)
                            : Theme.of(context).textTheme.button,
                      ),
                      padding: EdgeInsets.only(left: 17.0),
                    ),
                    secondary: Text(
                      choice.cost == null ? '' : '${choice.cost}€',
                      style: choice == state.selected
                          ? TextStyle(color: Colors.white, fontSize: 14.7)
                          : TextStyle(color: Colors.grey[800], fontSize: 14.7),
                    ),
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
    final disable = context.watch<ChoiceCubit>().state.selected;

    return Container(
      margin: EdgeInsets.only(bottom: 9.0),
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
          shape: StadiumBorder(),
          primary: Theme.of(context).accentColor,
        ),
        onPressed: disable == null
            ? null
            : () =>
                context.read<DailySituationCubit>().emitNextDailySituations(),
        child: Text(
          AppLocalizations.of(context)!.next.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
