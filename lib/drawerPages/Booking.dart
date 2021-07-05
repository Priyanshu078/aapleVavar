import 'package:aaple_vaavar/auth/authentication.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerPhone = new TextEditingController();
  TextEditingController _controllerPeople = new TextEditingController();
  TextEditingController _controllerAdults = new TextEditingController();
  TextEditingController _controllerChildren = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height - 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Booking Form",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  labelText: "Name",
                ),
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
              TextField(
                controller: _controllerPeople,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Total Number of People",
                  labelText: "Total People",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: TextField(
                        controller: _controllerAdults,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Number of Adults",
                          labelText: "Adults",
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: TextField(
                        controller: _controllerChildren,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Number of Children",
                          labelText: "Children",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                height: 60,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      Authentication.customSnackBar(
                          content:
                              "Form Submitted,\nWe will be contacting you shortly"));
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
