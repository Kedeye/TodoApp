import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:universite_qr_code/Orientationpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  ///Changed a little bit of buttons styling and text for the thumbnail lol
  ///Thanks for coming here :-)

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Scannez le code QR',
        body:
            'Allumez le "scanner" pour scanner le code QR des tickets d étudiant',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Allons-y", style: TextStyle(fontSize: 20)),
          ),
        ),
        image: Center(
          child: FractionallySizedBox(
            heightFactor: 1.4,
            child: Image.asset('assets/QR Code-rafiki.png'),
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Times New Roman',
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Scanner longtemps',
        body:
            'Lorsque vous cliquez sur Scan LT, le scan s exécute pendant une longue période, car il peut scanner de nombreuses Tickets .',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8),
            onPressed: () {},
            child: const Text(
              "Pourquoi attendre !",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        image: Center(
          child: FractionallySizedBox(
              heightFactor: 1.3, child: Image.asset('assets/QR Code-amico.png')),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Écoutez le ton',
        body:
            'Lorsque vous scannez le code QR, écoutez une tonalité, s agit-il d une tonalité d avertissement ou d un taux de réussite',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Commençons", style: TextStyle(fontSize: 20)),
          ),
        ),
        image: Center(
          child: FractionallySizedBox(
              heightFactor: 1.2,
              child: Image.asset('assets/Headphone-amico.png')),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 200, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'Fait',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Sauter',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Orientationpage()));
  }
}
