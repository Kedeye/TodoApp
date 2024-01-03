import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

import 'pages/addtach/addpage.dart';
import 'pages/home/home.dart';
import 'pages/log/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterNativeSplash.remove();

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? uid;

  const MyApp({Key? key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "loginPage",
      routes: {
        "loginPage": (context) => LoginPage(),
        "addPage": (context) => const AddPage(),
        "home": (context) => const HomePage(),
      },
    );
  }
}
