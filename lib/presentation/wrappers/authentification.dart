import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/logic/bloc/authentification_bloc.dart';
import 'package:projet4/presentation/pages/home.dart';
import 'package:projet4/presentation/pages/login.dart';

class AuthentificationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthentificationBloc, AuthentificationState>(
      builder: (context, state) => state.when(
        authenticated: HomePage(),
        unauthenticated: LoginPage(),
      ),
    );
  }
}
