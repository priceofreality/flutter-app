import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet4/constants/routes.dart';
import 'package:projet4/data/init.dart';
import 'package:projet4/data/models/summary.dart';
import 'package:projet4/data/models/transaction.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';
import 'package:projet4/logic/cubit/financial_situation_cubit.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:projet4/presentation/pages/end_game.dart';
import 'package:projet4/presentation/pages/error.dart';
import 'package:projet4/presentation/pages/home.dart';
import 'package:projet4/presentation/pages/summary.dart';
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
    _appRouter.define(
        TRANSACTIONS_PAGE, (Summary summary) => SummaryPage(summary: summary));
  }

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
          headline1: TextStyle(),
          headline2: TextStyle(),
        ),
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Color(0xff87CEEB), //Color(0xff5e60ce),
        buttonColor: Color(0xffe08963),
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
