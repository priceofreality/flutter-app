import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/constants/routes.dart';
import 'package:projet4/logic/cubit/summary_cubit.dart';
import 'package:projet4/presentation/pages/daily_situation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SummaryCubit, SummaryState>(
          listener: (context, state) {
            if (state.endGame) {
              Navigator.of(context).pushNamed(END_PAGE);
            }
          },
          child: DailySituationPage(),
        ),
      ),
    );
  }
}
