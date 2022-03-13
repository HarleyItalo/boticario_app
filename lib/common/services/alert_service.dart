import 'package:flutter/material.dart';

class AlertService {
  static void sendSnackBar(
      {required context,
      required String message,
      bool error = false,
      required void Function() onPressed}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: error ? Colors.redAccent : Colors.greenAccent,
        action: SnackBarAction(
            label: "Ok", onPressed: onPressed, textColor: Colors.black),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
