import 'package:flutter/material.dart';

class AboutRestro extends StatefulWidget {
  @override
  _AboutRestroState createState() => _AboutRestroState();
}

class _AboutRestroState extends State<AboutRestro> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Image.asset('res/poster.jpeg',
        height: double.infinity,width: double.infinity,
        ),
        Image.asset('res/poster1.jpeg',
          height: double.infinity,width: double.infinity,
        )
      ],
      //bottomNavigationBar: ,
    );
  }
}

