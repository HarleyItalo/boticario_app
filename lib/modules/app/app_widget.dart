import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Boticario App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme:
            ThemeData.dark().colorScheme.copyWith(primary: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      routes: Routes.getRoutes,
      initialRoute: Routes.splash,
    );
  }
}
