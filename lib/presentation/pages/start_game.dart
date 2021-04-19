import 'package:flutter/material.dart';
import 'package:price_of_reality/data/db/situations_options.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/logic/cubit/option_cubit.dart';
import 'package:price_of_reality/presentation/widgets/custom_radio_button.dart';
import 'package:price_of_reality/presentation/widgets/dot_indicator.dart';
import "package:collection/collection.dart";
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
          OptionView(),
        ],
      ),
      bottomNavigationBar: DotIndicator(
        length: 2,
        controller: controller,
      ),
    );
  }
}

class FinancialSituationView extends StatelessWidget {
  Future<List<FinancialSituation>> _sortFinancialSituations(
      BuildContext context) async {
    List<FinancialSituation> situations =
        context.read<FinancialSituationCubit>().financialSituations;
    situations.sort((a, b) => a.familySituation.label
        .toLowerCase()
        .compareTo(b.familySituation.label.toLowerCase()));
    return situations;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _sortFinancialSituations(context),
      builder: (BuildContext context,
          AsyncSnapshot<List<FinancialSituation>> snapshot) {
        if (snapshot.hasData) {
          return BlocBuilder<FinancialSituationCubit, FinancialSituationState>(
            builder: (context, state) {
              return ListView(
                  padding:
                      EdgeInsets.only(left: 14.0, right: 14.0, bottom: 20.0),
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.situations,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                    ),
                    ...snapshot.data!
                        .map(
                          (financialSituation) => Container(
                            margin: EdgeInsets.only(
                              bottom: 10.0,
                            ),
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
                  ]);
            },
          );
        }
        return Center(child: Text(AppLocalizations.of(context)!.loading));
      },
    );
  }
}

class OptionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, OptionState>(builder: (context, state) {
      return CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 25.0),
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.options,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
          ),
        ),
        ...state.options.entries
            .map(
              (e) => SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index == 0) {
                    return ListTile(
                      title: Text(
                        e.key.label,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.5,
                        ),
                      ),
                    );
                  }
                  return CheckboxListTile(
                    activeColor: Theme.of(context).buttonColor,
                    value: state.selected.contains(e.value[index - 1]),
                    onChanged: (value) => context
                        .read<OptionCubit>()
                        .emitSelectOption(value!, e.value[index - 1]),
                    title: Text(e.value[index - 1].label),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }, childCount: e.value.length + 1),
              ),
            )
            .toList(),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 14.0),
          sliver: SliverToBoxAdapter(
            child: StartButton(),
          ),
        ),
      ]);
    });
  }
}

class StartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disable = context.watch<FinancialSituationCubit>().state.selected;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          shape: StadiumBorder(),
          primary: Theme.of(context).accentColor,
        ),
        onPressed: disable == null
            ? null
            : () => context.read<GameCubit>().emitStartGame(),
        child: Text(AppLocalizations.of(context)!.start.toUpperCase()),
      ),
    );
  }
}
