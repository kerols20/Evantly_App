import 'package:flutter/material.dart';
extension CenterWidget on Widget{
  Widget setCenter(){
    return Center(
      child: this,
    );
  }
}