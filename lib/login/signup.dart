import 'package:aaple_vaavar/auth/authentication.dart';
import 'package:flutter/material.dart';
import 'package:aaple_vaavar/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _success = false;
  String _userEmail = '';
  void registerUserByEmailPassword() async {
    try {
      final User? user = (await auth.createUserWithEmailAndPassword(
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
                content:
                    "User Successfully registered with email " + _userEmail),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
                content: _userEmail + " already registered"),
          );
        }
        // try {
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //       builder: (context) => LoginPage(),
        //     ),
        //   );
        // } catch (e) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     Authentication.customSnackBar(content: "Email already registered"),
        //   );
        // }
      } else {
        setState(() {
          _success = true;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(content: "Email already registered"),
        );
      } else if (e.code == 'account-exists-with-different-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
                content:
                    'The account already exists with a different credential'));
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
                content: 'Error occurred while accessing credential'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Authentication.customSnackBar(
          content: 'Error registering the User!, Please try again'));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // inputFile(label: "Username"),
                    inputFile(label: "Email", controller: _emailController),
                    inputFile(
                        label: "Password",
                        obscureText: true,
                        controller: _passwordController),
                    inputFile(
                        label: "Confirm Password ",
                        obscureText: true,
                        controller: _password1Controller),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null) {
                      if (form.validate()) {
                        if (_passwordController.text.trim() ==
                            _password1Controller.text.trim()) {
                          registerUserByEmailPassword();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            Authentication.customSnackBar(
                                content:
                                    "Both password fields should have same password"),
                          );
                        }
                      }
                    }
                  },
                  color: Colors.orange,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
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
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
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
