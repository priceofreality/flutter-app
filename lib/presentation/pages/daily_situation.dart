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
    return Container(
      width: double.infinity,
      //padding: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: double.infinity,
              height: 100,
              child: TopBar(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff3f37c9), Color(0xff4895ef)]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              child: Column(
                children: [
                  Event(),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Budget(),
                  ),
                  SizedBox(height: 20.0),
                  Choices(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: NextButton(),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailySituationCubit, DailySituationState>(
        builder: (context, state) {
      return Container(
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.topCenter,
        child: Text(
          AppLocalizations.of(context)!.day + ' ${state.current.day}',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8),
        ),
      );
    });
  }
}

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailySituationCubit, DailySituationState>(
        builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Text(
          state.current.event,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      );
    });
  }
}

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancialSituationCubit, FinancialSituationState>(
        builder: (context, state) {
      return Text(
        AppLocalizations.of(context)!.budget +
            ': ${state.financialSituation.budget}€',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
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
