import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universite_qr_code/Orientationpage.dart';
import 'package:universite_qr_code/iintroduction_screen.dart';
import 'package:universite_qr_code/scanqr.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

bool show = true;
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  final sharedPref = await SharedPreferences.getInstance();
  String? uid = sharedPref.getString("UID");
  runApp(MyApp(uid: uid));

  show = sharedPref.getBool('ON_BOARDING') ?? true;
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final String? uid;

  MyApp({Key? key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          show ? 'introscreen' : (uid == null ? 'Orientationpage' : 'ScanQRPage'),
      routes: {
        "introscreen": (context) => IntroScreen(),
        "Orientationpage": (context) => Orientationpage(),
        "ScanQRPage": (context) => const ScanQRPage(),
      },
    );
  }
}
