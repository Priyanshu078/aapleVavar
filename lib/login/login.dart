import 'package:aaple_vaavar/auth/authentication.dart';
import 'package:aaple_vaavar/drawerPages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:aaple_vaavar/login/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Drawer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = false;
  String _userEmail = '';
  bool _isSigningIn = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> signInUserByEmailPassword() async {
    final User? user = (await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim()))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email.toString();
      });
      if (_success) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
              content: "User Successfully signIn with email " + _userEmail),
        );
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) => MyAppFul(user: user)),
        // );
      }
    } else {
      setState(() {
        _success = true;
      });
    }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(Authentication.customSnackBar(
    //       content: 'Error signIn User!, Please try again'));
    // }
    return user;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.orange,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        inputFile(label: "Email", controller: _emailController),
                        inputFile(
                            label: "Password",
                            obscureText: true,
                            controller: _passwordController)
                      ],
                    ),
                  ),
                ),
                _isSigningIn
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : FutureBuilder(
                        future:
                            Authentication.initializeFirebase(context: context),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error initializing Firebase');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return InkWell(
                              splashColor: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () async {
                                setState(() {
                                  _isSigningIn = false;
                                });

                                User? user =
                                    await Authentication.signInWithGoogle(
                                        context: context);

                                setState(() {
                                  _isSigningIn = false;
                                });

                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MyAppFul(
                                        user: user,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Image(
                                  image: AssetImage("res/google.png"),
                                  height: 45,
                                ),
                              ),
                            );
                          }
                          return CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.amberAccent),
                          );
                        },
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  // child: Container(
                  //   padding: EdgeInsets.only(top: 3, left: 3),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(100),
                  //       border: Border.all(
                  //         color: Colors.black
                  //       )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      final form = _formKey.currentState;
                      if (form != null) {
                        if (form.validate()) {
                          User? user = await signInUserByEmailPassword();
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MyAppFul(user: user)),
                            );
                          }
                        }
                      }
                    },
                    color: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.orange),
                        ))
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, required controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
