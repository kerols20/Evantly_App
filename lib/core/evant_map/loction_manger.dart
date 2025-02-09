import 'package:geolocator/geolocator.dart';

class LocationManager {
  static Future<Position> getCurrentLocation() async { // ✅ تصحيح اسم الدالة
    bool serviceEnabled;
    LocationPermission permission;

    // ✅ التحقق مما إذا كانت خدمات الموقع مفعلة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings(); // ✅ فتح إعدادات الموقع إذا كان معطلًا
      return Future.error('Location services are disabled.');
    }

    // ✅ التحقق من صلاحيات الوصول إلى الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // ⚠️ لا يمكن طلب الإذن مرة أخرى إذا كان مرفوضًا نهائيًا
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // ✅ إرجاع الموقع الحالي بعد التحقق من جميع الشروط
    return await Geolocator.getCurrentPosition();
  }
}
