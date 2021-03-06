import 'package:aaple_vaavar/auth/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aaple_vaavar/drawerPages/homescreen.dart';
import 'drawerPages/Booking.dart';
import 'drawerPages/aboutres.dart';
import 'drawerPages/contactus.dart';
import 'drawerPages/menu.dart';
import 'drawerPages/viewmaps.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'login/loginmain.dart';
import 'auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAppFul extends StatefulWidget {
  @override
  _MyAppFulState createState() => _MyAppFulState();
}

class _MyAppFulState extends State<MyAppFul> {
  late User _user;
  bool _isSigningOut = false;
  PageController _pageController = new PageController();

  @override
  void initState() {
    // _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('res/logo.png', scale: 15),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                        '     Enjoy Family Time @Farm\n   with delicious traditional food',
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 17))
                    .text
                    .red600
                    .lineHeight(1.5)
                    .make(),
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.orange),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "res/admin.png",
                            ),
                          ),
                          Text(
                            "Hello visitor!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "res/home.png",
                      // scale: 2,
                      width: 40,
                      height: 40,
                    ),
                    title: Text('HomePage'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _pageController.jumpToPage(0);
                      });
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      "res/maps.png",
                      // scale: 2,
                      width: 40,
                      height: 40,
                    ),
                    title: Text('View Location'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _pageController.jumpToPage(1);
                      });
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      "res/help_support.png",
                      // scale: 2,
                      width: 40,
                      height: 40,
                    ),
                    title: Text('Contact Us'),
                    onTap: () {
                      Navigator.pop(context);
                      _pageController.jumpToPage(3);
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      "res/submenu_ic.png",
                      // scale: 1.5,
                      width: 40,
                      height: 40,
                    ),
                    title: Text('Menu'),
                    onTap: () {
                      Navigator.pop(context);
                      _pageController.jumpToPage(2);
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      "res/logo.png",
                      width: 40,
                      height: 40,
                    ),
                    title: Text('About Us'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {});
                      _pageController.jumpToPage(4);
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'res/booking.png',
                      width: 40,
                      height: 40,
                    ),
                    title: Text('Booking'),
                    onTap: () {
                      Navigator.pop(context);
                      _pageController.jumpToPage(5);
                    },
                  ),
                ],
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.logout),
            //   title: Text('Log out'),
            //   onTap: () async {
            //     setState(() {
            //       _isSigningOut = true;
            //     });
            //     await Authentication.signOut(context: context);
            //     setState(() {
            //       _isSigningOut = false;
            //     });
            //     Navigator.pop(context);
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => HomePage()));
            //   },
            // ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Homescreen(),
          ViewMaps(),
          MenuList(),
          ContactUs(),
          AboutRestro(),
          Booking(),
        ],
        //bottomNavigationBar: ,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.height * 0.06,
        index: 0,
        backgroundColor: Colors.orange,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.map, size: 30),
          Icon(Icons.menu, size: 30),
          Icon(Icons.phone, size: 30),
          Icon(Icons.add_business_outlined, size: 30),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index); //Handle button tap
        },
      ),
    );
  }
}
