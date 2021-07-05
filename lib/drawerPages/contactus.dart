import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String phoneNo1 = '7722046601';
  String phoneNo2 = '7722046602';
  String phoneNo3 = '7588690924';
  String facebook =
      'https://www.facebook.com/%E0%A4%86%E0%A4%AA%E0%A4%B2%E0%A5%87-%E0%A4%B5%E0%A4%BE%E0%A4%B5%E0%A4%B0-101596208470998/';
  String youtube = 'https://www.youtube.com/channel/UCK6XF0RVhgjWTD5LZJkKpAQ';

  launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("can not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Card(
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.orange,
            child: ListTile(
              onTap: () {
                launchUrl('tel:+91' + phoneNo1);
              },
              subtitle: 'Aaple Vavar'.text.size(8).make(),
              leading: Icon(Icons.person, size: 35, color: Colors.black),
              tileColor: Colors.transparent,
              title: Text(phoneNo1).text.size(20).make(),
              trailing: Icon(
                Icons.call,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 20,
            color: Colors.orange,
            child: ListTile(
              onTap: () {
                launchUrl('tel:+91' + phoneNo2);
              },
              subtitle: 'Aaple Vavar'.text.size(8).make(),
              leading: Icon(
                Icons.person,
                size: 35,
                color: Colors.black,
              ),
              tileColor: Colors.transparent,
              title: Text(phoneNo2).text.size(20).make(),
              trailing: Icon(
                Icons.call,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 20,
            color: Colors.orange,
            child: ListTile(
              onTap: () {
                launchUrl('tel:+91' + phoneNo3);
              },
              subtitle: 'Aaple Vavar'.text.size(8).make(),
              leading: Icon(
                Icons.person,
                size: 35,
                color: Colors.black,
              ),
              tileColor: Colors.transparent,
              title: Text(phoneNo3).text.size(20).make(),
              trailing: Icon(
                Icons.call,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 20,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("res/contact1.png")),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(
                    'res/youtube.png',
                    scale: 7,
                  ),
                ),
                onTap: () {
                  launchUrl(youtube);
                },
              ),
              GestureDetector(
                child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(
                      'res/facebook.png',
                      scale: 10,
                    )),
                onTap: () {
                  launchUrl(facebook);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
