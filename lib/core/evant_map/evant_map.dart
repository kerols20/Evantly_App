import 'package:evanly/core/evant_map/loction_manger.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EvantMap extends StatefulWidget {
  EvantMap({super.key});

  @override
  State<EvantMap> createState() => _EvantMapState();
}

class _EvantMapState extends State<EvantMap> {
  var initalCamraPosition = CameraPosition(zoom: 14, target: LatLng(30.12, 35.2));
  GoogleMapController? _mapController;
  Marker? _userMarker; // Marker المستخدم

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var location = await LocationManager.getCurrentLocation();
          LatLng newPosition = LatLng(location.latitude, location.longitude);

          setState(() {
            // تحديث موقع الكاميرا
            initalCamraPosition = CameraPosition(zoom: 14, target: newPosition);

            // تحديث Marker بموقع المستخدم الجديد
            _userMarker = Marker(
              markerId: MarkerId("userLocation"),
              position: newPosition,
              infoWindow: InfoWindow(title: "موقعي الحالي"),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            );
          });

          // تحريك الكاميرا إلى الموقع الجديد
          _mapController?.animateCamera(CameraUpdate.newCameraPosition(initalCamraPosition));
        },
        child: Icon(Icons.location_searching_outlined),
      ),
      body: GoogleMap(
        initialCameraPosition: initalCamraPosition,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _userMarker != null ? {_userMarker!} : {}, // إضافة Marker إلى الخريطة
      ),
    );
  }
}
