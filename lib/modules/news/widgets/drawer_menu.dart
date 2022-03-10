import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_logout.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Olá",
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
        ListTile(
          title: const Text('Sair'),
          onTap: () {
            var logout = DependencyService.instance<MakeLogout>();
            logout();
            NavigationService.pushReplacementNamed(Routes.login);
          },
        ),
      ]),
    );
  }
}
