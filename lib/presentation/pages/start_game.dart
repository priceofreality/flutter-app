import 'package:flutter/material.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/logic/cubit/option_cubit.dart';
import 'package:price_of_reality/presentation/widgets/custom_radio_button.dart';
import 'package:price_of_reality/presentation/widgets/dot_indicator.dart';
import 'package:price_of_reality/data/db/situations_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartGamePage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          FinancialSituationView(),
          TView(),
          OptionsView(),
        ],
      ),
      bottomNavigationBar: DotIndicator(
        length: 3,
        controller: controller,
      ),
    );
  }
}

class FinancialSituationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          final padding = EdgeInsets.symmetric(horizontal: 14.0);
          return Center(
            child: FinancialSituationList(
              padding: padding,
            ),
          );
        }
        final width = MediaQuery.of(context).size.width;
        double horizontalPadding = width / 6;
        final padding = EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: 30.0,
          bottom: 10.0,
        );
        return FinancialSituationList(
          padding: padding,
        );
      },
    );
  }
}

class FinancialSituationList extends StatelessWidget {
  final EdgeInsets padding;

  FinancialSituationList({required this.padding});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancialSituationCubit, FinancialSituationState>(
      builder: (context, state) {
        return ListView(
          padding: padding,
          shrinkWrap: true,
          children: context
              .read<FinancialSituationCubit>()
              .financialSituations
              .map(
                (financialSituation) => Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: financialSituation == state.selected
                        ? Theme.of(context).buttonColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).buttonColor,
                    ),
                  ),
                  child: CustomRadioListTile<FinancialSituation>(
                    value: financialSituation,
                    groupValue: state.selected,
                    title: Text(
                      financialSituation.familySituation.label,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: financialSituation == state.selected
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      financialSituation.professionalSituation.label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: financialSituation == state.selected
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    onChanged: (newValue) => context
                        .read<FinancialSituationCubit>()
                        .emitSelectFinancialSituation(newValue!),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class OptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disable = context.watch<FinancialSituationCubit>().state.selected;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
            shape: StadiumBorder(),
            primary: Theme.of(context).accentColor,
          ),
          onPressed: disable == null
              ? null
              : () => context.read<GameCubit>().emitStartGame(),
          child: Text(AppLocalizations.of(context)!.start.toUpperCase()),
        ),
      ],
    );
  }
}

class TView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, OptionState>(builder: (context, state) {
      return ListView.builder(
        itemBuilder: (context, index) {
          for (MapEntry entry in state.options.entries) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(entry.value[index].label);
              },
              itemCount: entry.value.length,
            );
          }
          return Container();
        },
        itemCount: state.options.length,
      );
    });
  }
}
