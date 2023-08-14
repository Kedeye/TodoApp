import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

import 'Inroduction Pages/begin.dart';
import 'Inroduction Pages/introduction_screen.dart';
import 'Ticket/scanqr_code.dart';

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

  const MyApp({Key? key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          show ? 'introScreen' : (uid == null ? 'Begin' : 'ScanQR'),
      routes: {
        "introScreen": (context) => IntroScreen(),
        "Begin": (context) => const BeginScreen(),
        "ScanQR": (context) => const ScanQRPage(),
      },
    );
  }
}
