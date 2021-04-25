import 'package:flutter/material.dart';
import 'package:price_of_reality/logic/cubit/onboard_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/presentation/widgets/dot_indicator.dart';

class OnBoardPage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(
            AppLocalizations.of(context)!.title,
            style: TextStyle(
                fontSize: 27.0,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 35.0),
      ),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            View(
              title: AppLocalizations.of(context)!.experiment,
              subtitle: AppLocalizations.of(context)!.experimentDef,
              image: 'assets/images/experiment.jpg',
            ),
            View(
              title: AppLocalizations.of(context)!.yourChoices,
              subtitle: AppLocalizations.of(context)!.yourChoicesDef,
              image: 'assets/images/choice.png',
            ),
            View(
              title: AppLocalizations.of(context)!.explore,
              subtitle: AppLocalizations.of(context)!.exploreDef,
              image: 'assets/images/explore.png',
            ),
            View(
              title: AppLocalizations.of(context)!.getHelp,
              subtitle: AppLocalizations.of(context)!.getHelpDef,
              image: 'assets/images/help.png',
            ),
            StartButton(),
          ],
        ),
      ),
      bottomNavigationBar: DotIndicator(
        length: 5,
        controller: controller,
      ),
    );
  }
}

class View extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  View({required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 15.0, top: 40.0, left: 10.0, right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 35.0),
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  Future<void> _updateToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstLoad = false;
    await prefs.setBool('firstLoad', firstLoad);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 15.0, top: 40.0, left: 10.0, right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                height: 230,
                padding: EdgeInsets.symmetric(
                  vertical: 100.0,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/priceofreality.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.yourTurn,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 35.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
                  shape: StadiumBorder(),
                  primary: Theme.of(context).accentColor,
                ),
                onPressed: () => _updateToSharedPreferences().then((value) =>
                    context.read<OnboardCubit>().emitFirstLoad(false)),
                child: Text(
                    AppLocalizations.of(context)!.understand.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
