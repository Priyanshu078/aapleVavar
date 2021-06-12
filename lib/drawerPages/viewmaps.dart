import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
class ViewMaps extends StatefulWidget {
  @override
  _ViewMapsState createState() => _ViewMapsState();
}

class _ViewMapsState extends State<ViewMaps> {
  Set<Marker> _marker = {};
  late GoogleMapController controller;
  LatLng initialCameraPosition = LatLng(21.34996877816721, 79.0337336520624);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarker();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body : SafeArea(
          child: Column(
            children: [
              Flexible(
                child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(target: initialCameraPosition,
                zoom: 14),
                zoomControlsEnabled: true,
                markers: _marker,
                  mapType: MapType.normal,
    ),

              ),
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
              width: double.infinity,
              child: 'Want to get Directions?\n1. Tap on Marker\n2. Tap on Blue Button\n3. Get Directions on Google Map'.text.lineHeight(1.5).make())
            ],
          ),
        ));
  }
  void _onMapCreated(GoogleMapController controller) {
    controller = controller;
  }

  void getMarker() {
    setState(() {
      _marker.add(Marker(
        markerId: MarkerId('Aaple Vaavar Marker'),
        position: initialCameraPosition
      ));
    });
  }
}
