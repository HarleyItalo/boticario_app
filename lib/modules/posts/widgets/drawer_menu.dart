import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/common/widgets/observable.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_logout.dart';
import 'package:boticario_app/modules/posts/controllers/all_posts_controller.dart';
import 'package:flutter/material.dart';

import '../../news/widgets/menu_item_tile.dart';

class DrawerMenu extends StatelessWidget {
  final AllPostsController controller;
  const DrawerMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observable(
                  () => Text(
                    "Olá ${controller.userData.value.username ?? ''}!",
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MenuItemTile(
                icon: Icons.fiber_new,
                action: () {
                  NavigationService.pushNamed(Routes.news);
                },
                title: "Novidades GB",
              ),
              MenuItemTile(
                title: "Sair",
                action: () {
                  var logout = DependencyService.instance<MakeLogout>();
                  logout();
                  NavigationService.pushReplacementNamed(Routes.login);
                },
                icon: Icons.exit_to_app,
              )
            ]),
      ),
    );
  }
}
