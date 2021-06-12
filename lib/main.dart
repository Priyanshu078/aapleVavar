import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'login/loginmain.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.orange),
    darkTheme: ThemeData(primaryColor: Colors.orange),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(duration: 3, goToPage: HomePage()),
  ));
}
