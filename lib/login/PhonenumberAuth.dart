import 'dart:async';

import 'package:aaple_vaavar/auth/authentication.dart';
import 'package:aaple_vaavar/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneNumberAuth extends StatefulWidget {
  PhoneNumberAuth({Key? key}) : super(key: key);

  @override
  _PhoneNumberAuthState createState() => _PhoneNumberAuthState();
}

class _PhoneNumberAuthState extends State<PhoneNumberAuth> {
  TextEditingController _controllerPhone = new TextEditingController();
  TextEditingController _controllerOTP = new TextEditingController();
  String buttonText = "Send OTP";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String verificationID = "";
  int resendtoken = 0;
  late Timer _timer;
  bool _btnEnabled = false;
  Color color = Colors.black;
  int seconds = 30;

  _phoneNumberAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + _controllerPhone.text.toString(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            verificationID = verificationId;
            resendtoken = resendToken!;
          });
        },
        timeout: const Duration(seconds: 25),
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verificationID = verificationId;
          });
        });
  }

  _verifyNumber(String verificationId, int? resendToken) async {
    // Update the UI - wait for the user to enter the SMS code
    String smsCode = _controllerOTP.text.toString();

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await firebaseAuth.signInWithCredential(credential);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Phone Number Authentication",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Text(
                "Enter Phone No. and OTP",
                style: TextStyle(color: Colors.black, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone Number",
                  labelText: "Phone No.",
                ),
              ),
              Column(
                children: [
                  TextField(
                    controller: _controllerOTP,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'OTP',
                      labelText: 'OTP',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("OTP not recieved,"),
                      TextButton(
                          onPressed: _btnEnabled
                              ? () {
                                  _phoneNumberAuth();
                                  startTimer();
                                }
                              : null,
                          child: Text(
                            "Resend  OTP",
                            style: TextStyle(color: color),
                          )),
                      Text("$seconds:00"),
                    ],
                  ),
                ],
              ),
              MaterialButton(
                height: 60,
                minWidth: double.infinity,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  if (buttonText == "Send OTP") {
                    if (_controllerPhone.text.isNotEmpty) {
                      _phoneNumberAuth();
                      startTimer();
                      setState(() {
                        buttonText = "Verify";
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        Authentication.customSnackBar(
                            content: "Please enter Phone No."),
                      );
                    }
                  } else {
                    _verifyNumber(verificationID, resendtoken);
                    setState(() {
                      _controllerPhone.text = "";
                      _controllerPhone.text = "";
                    });
                  }
                },
                child: Text(buttonText,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
            ]),
      ),
    );
  }

  startTimer() {
    const onesec = Duration(seconds: 1);
    _timer = Timer.periodic(onesec, (Timer timer) {
      if (seconds == 0) {
        timer.cancel();
        setState(() {
          _btnEnabled = true;
          color = Colors.green;
          buttonText = "Send OTP";
          seconds = 30;
        });
      } else {
        setState(() {
          seconds -= 1;
        });
      }
    });
  }
}
