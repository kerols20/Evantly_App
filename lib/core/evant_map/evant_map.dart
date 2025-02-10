import 'package:evanly/core/evant_map/loction_manger.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EvantMap extends StatefulWidget {
  EvantMap({super.key});

  @override
  State<EvantMap> createState() => _EvantMapState();
}

class _EvantMapState extends State<EvantMap> {
  var initalCamraPosition = CameraPosition(zoom: 12, target: LatLng(30.12, 35.2));
  GoogleMapController? _mapController; // ✅ متغير للتحكم في الكاميرا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            var loction = await LocationManager.getCurrentLocation();
            _mapController?.animateCamera(
              CameraUpdate.newLatLngZoom(
                LatLng(loction.latitude, loction.longitude), 5,
              ),
            );
            print("📍 الموقع الحالي: ${loction.latitude}, ${loction.longitude}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("الموقع: ${loction.latitude}, ${loction.longitude}")),
            );
          } catch (e) {
            print("❌ خطأ: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("خطأ في جلب الموقع: $e")),
            );
          }
        },
        child: Icon(Icons.location_searching_outlined),
      ),
      body: GoogleMap(
        initialCameraPosition: initalCamraPosition,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller; // ✅ تخزين الكنترول عند تحميل الخريطة
        },
      ),
    );
  }
}
