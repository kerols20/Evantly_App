import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void Services_loading(){
  // EasyLoading it works by system singleton class
  // use EasyLoading to accuses at any place
  EasyLoading.instance
    ..displayDuration = Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = app_color.appColorGeneral
    ..backgroundColor = app_color.appColorsecound.withOpacity(0.5)
    ..indicatorColor = app_color.appColorGeneral
    ..textColor = app_color.appColorGeneral
    ..maskColor = app_color.appColorsecound.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;

}