import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/logic/cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => CounterCubit(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Counter(),
              SizedBox(height: 50),
              CounterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(state.toString());
        },
      ),
    );
  }
}

class CounterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () => context.read<CounterCubit>().emitDecrement(),
          child: Icon(Icons.remove),
          shape: CircleBorder(),
          color: Theme.of(context).accentColor,
        ),
        FlatButton(
          onPressed: () => context.read<CounterCubit>().emitIncrement(),
          child: Icon(Icons.add),
          shape: CircleBorder(),
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
