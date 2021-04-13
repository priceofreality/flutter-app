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
                fontSize: 25.0,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 20.0),
      ),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            FirstView(),
            SecondView(),
            ThirdView(),
            FourthView(),
          ],
        ),
      ),
      bottomNavigationBar: Dot4IndicatorGroup(
        controller: controller,
      ),
    );
  }
}

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_960_720.jpg'),
            ),
            Text(
              'Expérimenter Vivre une expérience mensuelle d’une personne vivant en situation de précarité financière',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            //SizedBox(height: 46.0)
          ],
        ),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.title),
          Image.network(
              'https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_960_720.jpg'),
          Text(
            'Faire vos choix Dans ce jeu, vous êtes le seul maître de la gestion de votre budget',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 46.0)
        ],
      ),
    );
  }
}

class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.title),
          Image.network(
              'https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_960_720.jpg'),
          Text(
            'Explorer les alternatives Le jeu “le prix de la réalité” propose un panel de situations différentes',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 46.0)
        ],
      ),
    );
  }
}

class FourthView extends StatelessWidget {
  Future<void> _updateToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstLoad = false;
    await prefs.setBool('firstLoad', firstLoad);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.title),
          Image.network(
              'https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_960_720.jpg'),
          Text(
            'S’aider et se faire accompagner à l’aide de différentes applications et endroits proposés par la Belgique pour apprendre à gérer son budget',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
              shape: StadiumBorder(),
              primary: Theme.of(context).accentColor,
            ),
            onPressed: () => _updateToSharedPreferences().then(
                (value) => context.read<OnboardCubit>().emitFirstLoad(false)),
            child: Text(AppLocalizations.of(context)!.understand.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
