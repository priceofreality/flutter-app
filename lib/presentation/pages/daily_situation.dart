import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/logic/cubit/choice_cubit.dart';
import 'package:price_of_reality/logic/cubit/transaction_cubit.dart';
import 'package:price_of_reality/logic/cubit/daily_situation_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:price_of_reality/presentation/widgets/custom_radio_button.dart';
import 'package:price_of_reality/presentation/widgets/custom_slider.dart';

class DailySituationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (conext, orientation) {
        if (orientation == Orientation.portrait) {
          final padding = EdgeInsets.symmetric(horizontal: 14.0);
          final eventPadding =
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0);
          return DailySituationView(
              padding: padding, eventPadding: eventPadding);
        }
        final width = MediaQuery.of(context).size.width;
        double horizontalPadding = width / 6;
        double event = width / 7;
        final padding = EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: 30.0,
          bottom: 10.0,
        );
        final eventPadding =
            EdgeInsets.symmetric(vertical: 20.0, horizontal: event);
        return DailySituationView(padding: padding, eventPadding: eventPadding);
      },
    );
  }
}

class DailySituationView extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets eventPadding;

  DailySituationView({required this.padding, required this.eventPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 80,
                child: TopBar(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff87CEEB),
                        Color(0xff66c1e5),
                      ]),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height - kToolbarHeight - 200.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Event(eventPadding: eventPadding),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: padding,
                    child: Container(
                      child: Column(
                        children: [
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
                ],
              ),
            ),
          )
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
        padding: EdgeInsets.only(top: 20.0),
        alignment: Alignment.topCenter,
        child: Text(
          AppLocalizations.of(context)!.day + ' ${state.current.day}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    });
  }
}

class Event extends StatelessWidget {
  final EdgeInsets eventPadding;

  Event({required this.eventPadding});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailySituationCubit, DailySituationState>(
        builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: eventPadding,
        child: Text(
          state.current.event,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
      );
    });
  }
}

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
      return Text(
        AppLocalizations.of(context)!.budget +
            ': ${state.budget.toStringAsFixed(2)}€',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
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
          children: state.choices.map((choice) {
            if (choice.maxCost == null) {
              return Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: choice == state.selected
                        ? Theme.of(context).buttonColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).buttonColor,
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
                      choice.minCost == null ? '' : '${choice.minCost}€',
                      style: choice == state.selected
                          ? TextStyle(color: Colors.white, fontSize: 14)
                          : TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                    value: choice,
                    groupValue: state.selected,
                    onChanged: (newValue) {
                      if (state.selected != null) return;

                      context.read<ChoiceCubit>().emitSelectChoice(newValue!);
                      context.read<TransactionCubit>().emitCost(
                          newValue.minCost == null ? 0 : newValue.minCost!);

                      Future.delayed(Duration(milliseconds: 230)).then(
                          (value) => context
                              .read<DailySituationCubit>()
                              .emitNextDailySituation());
                    },
                  ));
            } else {
              context.read<ChoiceCubit>().emitSelectChoice(choice);
              return Column(
                children: [
                  CustomSlider(
                    maxValue: -choice.maxCost!,
                    minValue: -choice.minCost!,
                    divisions: 10,
                    onChanged: (value) {
                      context.read<TransactionCubit>().emitCost(-value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14.0, top: 30.0),
                    child: NextButton(),
                  ),
                ],
              );
            }
          }).toList(),
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
            : () => Future.delayed(Duration(milliseconds: 230)).then((value) =>
                context.read<DailySituationCubit>().emitNextDailySituation()),
        child: Text(
          AppLocalizations.of(context)!.next.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
