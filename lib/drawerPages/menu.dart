import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aaple_vaavar/Lists/ImageLists.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.all(20),
        child: Column(
      children: [
        Container(
          //  padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.orangeAccent])),

          width: double.infinity,
          child: Column(
            children: [
              'Activity Menu'.text.xl3.make(),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'veg/non-veg food'.text.uppercase.make(),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  'farming experience'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'vintage games'.text.uppercase.make(),
                  'bullock cart ride'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'organic fruits/veg'.text.uppercase.make(),
                  'animal husbandry'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'rain dance'.text.uppercase.make(),
                  'kids pool'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.orangeAccent])),
          width: double.infinity,
          child: Column(
            children: [
              'Food Menu'.text.xl3.make(),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Lunch Includes:'.text.uppercase.make(),
                  'Non Veg: On Demand'.text.uppercase.make(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Masala Vangi/\npatodi rassa'.text.uppercase.make(),
                  'mutton handi -\n rs 950/-'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'bharit/zunka/\naamti bhakar'.text.uppercase.make(),
                  'gavrani chicken\n handi - rs 750/-'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'chapati/dal/rice/\nkadhi/sweet/salad'.text.uppercase.make(),
                  'broiler chicken \nhandi - rs 500/-'.text.uppercase.make(),
                ],
              ),
              HeightBox(20),
            ],
          ),
        ),
        Expanded(
          child: CarouselSlider.builder(
              itemCount: ImageList.images2.length,
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
                            image: AssetImage(ImageList.images2[index]),
                            fit: BoxFit.cover)));
              }),
        ),
      ],
    ));
  }
}
