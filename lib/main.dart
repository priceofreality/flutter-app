import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet4/constants/routes.dart';
import 'package:projet4/data/init.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';
import 'package:projet4/logic/cubit/financial_situation_cubit.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:projet4/logic/cubit/summary_cubit.dart';
import 'package:projet4/presentation/pages/end_game.dart';
import 'package:projet4/presentation/pages/error.dart';
import 'package:projet4/presentation/pages/home.dart';
import 'package:projet4/presentation/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DataInit.loadGameAssets().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  final ChoiceCubit choiceCubit = ChoiceCubit();
  final FinancialSituationCubit financialSituationCubit =
      FinancialSituationCubit();

  late final DailySituationCubit dailySituationCubit = DailySituationCubit(
      choiceCubit: choiceCubit,
      financialSituationCubit: financialSituationCubit);
  late final GameCubit gameCubit =
      GameCubit(dailySituationCubit: dailySituationCubit);

  MyApp() : super() {
    _appRouter.define(HOME_PAGE, (_) => HomePage());
    _appRouter.define(ERROR_PAGE, (String arg) => ErrorPage(message: arg));
    _appRouter.define(END_PAGE, () => EndGamePage());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galette de Ble',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr', ''),
      ],
      initialRoute: HOME_PAGE,
      onGenerateRoute: _appRouter.onGenerateRoute,
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(
            //letterSpacing: 0.8,
            color: Colors.black,
            fontSize: 17.0,
          ),
        ),
        fontFamily: 'Montserrat',
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
        accentColor: Color(0xff5e60ce),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => gameCubit,
          ),
          BlocProvider(
            create: (_) => dailySituationCubit,
          ),
          BlocProvider(
            create: (_) => choiceCubit,
          ),
          BlocProvider(
            create: (_) => financialSituationCubit,
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
