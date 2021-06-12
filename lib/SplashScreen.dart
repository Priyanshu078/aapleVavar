import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final int duration;
  final Widget goToPage;
  SplashScreen({required this.duration, required this.goToPage});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });
    return Scaffold(
        body: Container(
            color: Color(0xfff7f7f7),
            alignment: Alignment.center,
            child: Image(image: AssetImage('res/logo.png'))));
  }
}
