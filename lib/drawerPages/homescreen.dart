import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aaple_vaavar/Lists/ImageLists.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HeightBox(
            MediaQuery.of(context).size.height * 0.025,
          ),
          CarouselSlider.builder(
              itemCount: ImageList.images.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.25,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1300),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(ImageList.images[index]),
                            fit: BoxFit.cover)));
              }),
          HeightBox(
            MediaQuery.of(context).size.height * 0.025,
          ),
          Divider(thickness: 1, color: Colors.orange),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    color: Colors.orangeAccent,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Family Tour',
                                    style: TextStyle(fontFamily: 'Jomhuria'))
                                .text
                                .white
                                .size(40)
                                .uppercase
                                .make(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Corporate Tour',
                                    style: TextStyle(fontFamily: 'Jomhuria'))
                                .text
                                .white
                                .size(40)
                                .uppercase
                                .make(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Ladies Group',
                                    style: TextStyle(fontFamily: 'Jomhuria'))
                                .text
                                .white
                                .size(40)
                                .uppercase
                                .make(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('School Picnic',
                                    style: TextStyle(fontFamily: 'Jomhuria'))
                                .text
                                .white
                                .size(40)
                                .uppercase
                                .make(),
                          ],
                        ),
                      ],
                    )),
                HeightBox(
                  MediaQuery.of(context).size.height * 0.005,
                ),
                Divider(thickness: 1, color: Colors.orange),
                HeightBox(
                  MediaQuery.of(context).size.height * 0.005,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    // color: Colors.red,
                    decoration: BoxDecoration(color: Colors.green),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        //         // mainAxisAlignment: MainAxisAlignment.start,
                        //         // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Packages",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Morning Glory : 6 to 10 am with breakfast",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Evening Calm : 2 to 6 pm with snacks",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Day Out : 10am to 5pm with breakfast,\nLunch and Evening Snacks",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //           // Row(
                          //           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //           //   children: [
                          //           //     'Packages'.text.bold.size(20).yellow300.make(),
                          //           //   ],
                          //           // ),
                          //           // HeightBox(15),
                          //           // 'Morning Glory : 6 to 10 am with breakfast'
                          //           //     .text
                          //           //     .bold
                          //           //     .size(12)
                          //           //     .white
                          //           //     .make(),
                          //           // HeightBox(15),
                          //           // 'Evening Calm : 2 to 6 pm with snacks'
                          //           //     .text
                          //           //     .bold
                          //           //     .size(12)
                          //           //     .white
                          //           //     .make(),
                          //           // HeightBox(15),
                          //           // 'Day Out : 10am to 5pm with breakfast,\n  Lunch and Evening Snacks'
                          //           //     .text
                          //           //     .bold
                          //           //     .size(12)
                          //           //     .white
                          //           //     .make(),
                          //           // HeightBox(15),
                          //         ],
                          //       ),
                          //
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
