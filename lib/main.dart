  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet4/constants/routes.dart';
import 'package:projet4/logic/bloc/authentification_bloc.dart';
import 'package:projet4/logic/cubit/internet_cubit.dart';
import 'package:projet4/presentation/pages/error.dart';
import 'package:projet4/presentation/pages/home.dart';
import 'package:projet4/presentation/pages/login.dart';
import 'package:projet4/presentation/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projet4/presentation/wrappers/authentification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({Key key}) : super(key: key) {
    _appRouter.define(HOME_PAGE, () => HomePage());
    _appRouter.define(ERROR_PAGE, (String arg) => ErrorPage(message: arg));
    _appRouter.define(LOGIN_PAGE, () => LoginPage());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('fr', ''),
        ],
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<InternetCubit>(
              create: (_) => InternetCubit(),
            ),
            BlocProvider<AuthentificationBloc>(
              create: (_) => AuthentificationBloc(),
            ),
          ],
          child: AuthentificationWrapper(),
        ));
  }
}
