import 'package:flutter/material.dart';

class AlertService {
  static void sendSnackBar(
      {required context,
      required String message,
      bool error = false,
      required void Function() onPressed}) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      duration: const Duration(seconds: 5),
      backgroundColor: error ? Colors.redAccent : Colors.greenAccent,
      action: SnackBarAction(
        label: "Ok",
        textColor: error ? Colors.white : Colors.black,
        onPressed: onPressed,
      ),
    ));
  }
}
