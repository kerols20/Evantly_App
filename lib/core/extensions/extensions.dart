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
