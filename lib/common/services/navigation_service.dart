import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void pushNamed(
    String name, {
    Object? args,
  }) async {
    await navigatorKey.currentState?.pushNamed(
      name,
      arguments: args,
    );
  }

  static void pushNamedAndRemoveUntil(
    String name, {
    Object? args,
  }) async {
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(name, (route) => false, arguments: args);
  }

  static void pushReplacementNamed(
    String name, {
    Object? args,
  }) async {
    navigatorKey.currentState?.pushReplacementNamed(name, arguments: args);
  }

  static void pop() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }

  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static getArgs(context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    return args;
  }
}
