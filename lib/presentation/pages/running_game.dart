import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/situations_options.dart';
import 'package:price_of_reality/logic/cubit/choice_cubit.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/transaction_cubit.dart';
import 'package:price_of_reality/logic/cubit/daily_situation_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:price_of_reality/presentation/widgets/custom_radio_button.dart';
import 'package:price_of_reality/presentation/widgets/custom_slider.dart';

class RunningGamePage extends StatelessWidget {
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
            child: Column(
              children: [
                Text(
                  "${AppLocalizations.of(context)!.situation} : ",
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10.0),
                Text(
                  "${context.read<FinancialSituationCubit>().state.selected!.familySituation.label}",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).buttonColor),
                ),
                Text(
                  "${context.read<FinancialSituationCubit>().state.selected!.professionalSituation.label}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5,
                      color: Theme.of(context).buttonColor),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height - kToolbarHeight - 200.0,
              ),
              child: BlocBuilder<DailySituationCubit, DailySituationState>(
                  builder: (context, state) {
                return Column(
                  key: ValueKey<int>(state.current.id),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RewindButton(),
                    Event(
                      event: state.current.event,
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
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
                );
              }),
            ),
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
  final String event;

  Event({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:
          EdgeInsets.only(bottom: 20.0, left: 30.0, right: 30.0, top: 40.0),
      child: Text(
        event,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
      ),
    );
  }
}

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
      return RichText(
        text: TextSpan(
          text: '${AppLocalizations.of(context)!.budget} : ',
          style: DefaultTextStyle.of(context).style.copyWith(
                fontSize: 18.5,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
          children: [
            TextSpan(
              text: '${state.budget.toStringAsFixed(2)}€',
              style: TextStyle(
                color: state.budget >= 0 ? Colors.black : Colors.red[600],
              ),
            ),
          ],
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

                      Future.delayed(Duration(milliseconds: 600)).then(
                          (value) => context
                              .read<DailySituationCubit>()
                              .emitNextDailySituation());
                    },
                  ));
            } else {
              context.read<ChoiceCubit>().emitSelectChoice(choice);
              context.read<TransactionCubit>().emitCost(choice.minCost!);

              double min = choice.minCost!.abs();
              double max = choice.maxCost!.abs();
              return Column(
                key: ValueKey<Choice>(choice),
                children: [
                  CustomSlider(
                    maxValue: max,
                    minValue: min,
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
            : () => Future.delayed(Duration(milliseconds: 600)).then((value) =>
                context.read<DailySituationCubit>().emitNextDailySituation()),
        child: Text(
          AppLocalizations.of(context)!.next.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class RewindButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<DailySituationCubit>().emitRewind(),
      child: Icon(Icons.rotate_left),
    );
  }
}
