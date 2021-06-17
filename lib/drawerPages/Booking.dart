import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  final url =
      "https://docs.google.com/forms/d/e/1FAIpQLSfc639sJK1N2A1xbYWCLY68Dkbz6_B8vFPQU7aRfrUhz3jwVw/viewform?usp=sf_link";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "Looking to Visit Aaple Vavar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Book a Slot by filling this simple form",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: Colors.green,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              height: 60,
              onPressed: () {
                launch(url);
              },
              child: Text(
                "Form",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Thanks for visiting",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
