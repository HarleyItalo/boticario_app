import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boticario App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: NavigationService.navigatorKey,
        home: Container());
  }
}
