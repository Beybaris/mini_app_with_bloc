import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:innlab_bloc_test_example/pages/contacts/model/contact.dart';

class MapScreen extends StatefulWidget {

  final Contact contact;

  const MapScreen({Key? key, required this.contact}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Set<Marker> _markers ={};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(double.parse(widget.contact.address!.geo!.lat.toString()), double.parse(widget.contact.address!.geo!.lng.toString())),
        infoWindow: InfoWindow(
          title: widget.contact.address!.city.toString(),
          snippet: widget.contact.address!.street,
        )
      ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(widget.contact.address!.geo!.lat.toString()), double.parse(widget.contact.address!.geo!.lng.toString())),
            zoom: 10,
        //double.parse(widget.contact.address!.geo!.lat.toString()), double.parse(widget.contact.address!.geo!.lng.toString()
          ),
      )

      );
  }
}
