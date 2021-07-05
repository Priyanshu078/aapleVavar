import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'login/loginmain.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.orange),
    darkTheme: ThemeData(primaryColor: Colors.orange),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(duration: 3, goToPage: HomePage()),
  ));
}
