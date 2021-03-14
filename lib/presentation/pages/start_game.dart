import 'package:flutter/material.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/presentation/widgets/dot_indicator.dart';
import 'package:projet4/presentation/widgets/grid_button.dart';

class StartGamePage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          FamilySituationView(),
          FinancialSituationView(),
          OptionsView(),
        ],
      ),
      bottomNavigationBar: DotIndicatorGroup(
        controller: controller,
      ),
    );
  }
}

enum Test { A, B }

class FamilySituationView extends StatefulWidget {
  @override
  _FamilySituationViewState createState() => _FamilySituationViewState();
}

class _FamilySituationViewState extends State<FamilySituationView> {
  Test _test = Test.A;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          GridButton<Test>(
            value: Test.A,
            groupValue: _test,
            onChanged: (newValue) {
              setState(() {
                _test = newValue;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                ),
                Text('Solo'),
              ],
            ),
          ),
          GridButton<Test>(
            value: Test.B,
            groupValue: _test,
            onChanged: (newValue) {
              setState(() {
                _test = newValue;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  size: 80,
                ),
                Text('Couple'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FinancialSituationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ElevatedButton(
            child: Text('MUtuelle'),
            onPressed: null,
          ),
          ElevatedButton(
            child: Text('salaire bas'),
            onPressed: null,
          ),
          ElevatedButton(
            child: Text('cpAS'),
            onPressed: null,
          ),
          ElevatedButton(
            child: Text('ss'),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class OptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => context.read<GameCubit>().emitStartGame(),
        child: Text('Start'));
  }
}