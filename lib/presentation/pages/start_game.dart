import 'package:flutter/material.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/situations_options.dart';
import 'package:price_of_reality/data/models/option_group_icons.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_state.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/logic/cubit/option_cubit.dart';
import 'package:price_of_reality/logic/cubit/option_state.dart';
import 'package:price_of_reality/presentation/widgets/custom_radio_button.dart';
import 'package:price_of_reality/presentation/widgets/dot_indicator.dart';
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
          FamilySituationView(controller: controller),
          ProfessionalSituationView(controller: controller),
          OptionView(),
        ],
      ),
      bottomNavigationBar: DotIndicator(
        length: 3,
        controller: controller,
      ),
    );
  }
}

class ProfessionalSituationView extends StatelessWidget {
  final PageController controller;

  ProfessionalSituationView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final hasFamilySituation =
        context.watch<FinancialSituationCubit>().state.selectedFamilySituation;

    return BlocBuilder<FinancialSituationCubit, FinancialSituationState>(
        builder: (context, state) {
      if (hasFamilySituation == null) {
        return Center(
            child:
                Text(AppLocalizations.of(context)!.selectFamilySituationFirst));
      }

      final professionalSituations = context
          .read<FinancialSituationCubit>()
          .professionalSituations(context
              .read<FinancialSituationCubit>()
              .state
              .selectedFamilySituation!);

      return ListView(
          padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 20.0),
          children: [
            Container(
              padding: EdgeInsets.only(top: 25.0, bottom: 50.0),
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.professionalSituation,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
            ...professionalSituations
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: e == state.selectedProfessionalSituation
                          ? Theme.of(context).buttonColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).buttonColor,
                      ),
                    ),
                    child: CustomRadioListTile<ProfessionalSituation>(
                      value: e,
                      groupValue: state.selectedProfessionalSituation,
                      title: Text(
                        e.label,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: e == state.selectedProfessionalSituation
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      onChanged: (newValue) => context
                          .read<FinancialSituationCubit>()
                          .emitProfessionalSituation(newValue!),
                    ),
                  ),
                )
                .toList(),
            SizedBox(
              height: 20.0,
            ),
            NextButton(controller: controller, to: 2),
          ]);
    });
  }
}

class FamilySituationView extends StatelessWidget {
  final PageController controller;

  FamilySituationView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final familySituations =
        context.read<FinancialSituationCubit>().familySituations;

    return BlocBuilder<FinancialSituationCubit, FinancialSituationState>(
        builder: (context, state) {
      return ListView(
          padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 20.0),
          children: [
            Container(
              padding: EdgeInsets.only(top: 25.0, bottom: 50.0),
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.familySituation,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
            ...familySituations
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: e == state.selectedFamilySituation
                          ? Theme.of(context).buttonColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).buttonColor,
                      ),
                    ),
                    child: CustomRadioListTile<FamilySituation>(
                      value: e,
                      groupValue: state.selectedFamilySituation,
                      title: Text(
                        e.label,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: e == state.selectedFamilySituation
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      onChanged: (newValue) => context
                          .read<FinancialSituationCubit>()
                          .emitFamilySituation(newValue!),
                    ),
                  ),
                )
                .toList(),
            SizedBox(
              height: 20.0,
            ),
            NextButton(controller: controller, to: 1),
          ]);
    });
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
                        (e.key as OptionGroup).label,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.5,
                        ),
                      ),
                    );
                  }

                  if ((e.key as OptionGroup).id == 1) {
                    return CheckboxListTile(
                      activeColor: Theme.of(context).buttonColor,
                      value: state.miscellaneousSelected
                          .contains(e.value[index - 1]),
                      onChanged: (value) => context
                          .read<OptionCubit>()
                          .emitSelectMiscellaneousOption(
                              value!, e.value[index - 1]),
                      title: Text(e.value[index - 1].label),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }

                  if (e.value[index - 1].optionGroupIcons != null)
                    e.value[index - 1].optionGroupIcons!
                        .sort((a, b) => a.index.compareTo(b.index));

                  return RadioListTile<Option>(
                    activeColor: Theme.of(context).buttonColor,
                    title: e.value[index - 1].optionGroupIcons == null
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.more_horiz),
                          )
                        : Wrap(
                            children: e.value[index - 1].optionGroupIcons!
                                .map((o) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: o.icon,
                                    ))
                                .toList(),
                          ),
                    subtitle: Text(e.value[index - 1].label),
                    value: e.value[index - 1],
                    groupValue: state.groupSelected[e.key],
                    onChanged: (value) => context
                        .read<OptionCubit>()
                        .emitSelectGroupOption(
                            e.key as OptionGroup, e.value[index - 1]),
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

class NextButton extends StatelessWidget {
  final PageController controller;
  final int to;

  NextButton({required this.controller, required this.to});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          shape: StadiumBorder(),
          primary: Theme.of(context).accentColor,
        ),
        onPressed: () => controller.animateToPage(to,
            duration: Duration(milliseconds: 200), curve: Curves.easeInOut),
        child: Text(AppLocalizations.of(context)!.next.toUpperCase()),
      ),
    );
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
