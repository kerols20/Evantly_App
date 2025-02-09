import 'package:evanly/core/evant_map/loction_manger.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EvantMap extends StatelessWidget {
  EvantMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async { // ✅ استخدم async-await للتعامل مع Future
          try {
            Position position = await LocationManager.getCurrentLocation();
            print("📍 الموقع الحالي: ${position.latitude}, ${position.longitude}");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("الموقع: ${position.latitude}, ${position.longitude}"))
            );
          } catch (e) {
            print("❌ خطأ: $e");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("خطأ في جلب الموقع: $e"))
            );
          }
        },
        child: Icon(Icons.location_searching_outlined),
      ),
    );
  }
}
