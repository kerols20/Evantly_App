import 'package:bot_toast/bot_toast.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';
class SanckBarServices {
  static void showSuccessMessage(String message) {
    BotToast.showCustomNotification(toastBuilder: ( void Function() cancelFunc) {
      return Card(
        color: app_color.appColorGeneral,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }, duration: const Duration(seconds: 4), dismissDirections: [DismissDirection.startToEnd]);
  }

  static void showErrorMessage(String message) {
    BotToast.showCustomNotification(toastBuilder: ( void Function() cancelFunc) {
      return Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }, duration: const Duration(seconds: 4), dismissDirections: [DismissDirection.startToEnd]);
  }
}
