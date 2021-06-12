import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return
      //   Scaffold(appBar: Myappbar(title: Text('New Order'),
      // ),
      //   body: 
      Column(
        children: [
          ListTile(
              onTap:(){},
              subtitle: 'Aaple Vaavar'.text.size(8).make(),
              leading: Icon(Icons.verified_user),
              tileColor: Colors.transparent,
              title: Text('7722046601').text.size(20).make()),
          ListTile(
              onTap:(){},
              subtitle: 'Aaple Vaavar'.text.size(8).make(),
              leading: Icon(Icons.verified_user),
              tileColor: Colors.transparent,
              title: Text('7722046602').text.size(20).make()),
          ListTile(
              onTap:(){},
              subtitle: 'Aaple Vaavar'.text.size(8).make(),
              leading: Icon(Icons.verified_user),
              tileColor: Colors.transparent,
              title: Text('7588690924').text.size(20).make()),
        ],
      );
  }
}



