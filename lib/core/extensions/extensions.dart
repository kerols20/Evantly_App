import 'package:flutter/material.dart';
extension CenterWidget on Widget{
  Widget setCenter(){
    return Center(
      child: this,
    );
  }
}
extension RightWidget on Widget{
  Widget setRight(){
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }
}
extension Responsive on num{
  Widget get spaceVertcial => SizedBox(height: toDouble());
  Widget get spaceHorzintail => SizedBox(width: toDouble());
}
extension ContextExtensions on BuildContext {
  // للحصول على عرض الشاشة
  double get screenWidth => MediaQuery.of(this).size.width;

  // للحصول على ارتفاع الشاشة
  double get screenHeight => MediaQuery.of(this).size.height;

  // للحصول على اللون الأساسي من ThemeData
  Color get primaryColor => Theme.of(this).primaryColor;

  // للتنقل إلى صفحة جديدة
  void navigateTo(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // استبدال الصفحة الحالية بصفحة جديدة
  void navigateAndReplace(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // العودة إلى الصفحة السابقة
  void goBack() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }

  // عرض SnackBar بسهولة
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

