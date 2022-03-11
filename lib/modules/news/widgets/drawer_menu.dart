import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/common/widgets/observable.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_logout.dart';
import 'package:boticario_app/modules/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final NewsController controller;
  const DrawerMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observable(
            () => Text(
              "Olá ${controller.userData.value.username}!",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ListTile(
          title: const Text('News'),
          onTap: () {},
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
