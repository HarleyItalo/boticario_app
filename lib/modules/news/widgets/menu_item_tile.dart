import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  final String title;
  final Function() action;
  final IconData icon;

  const MenuItemTile({
    Key? key,
    required this.title,
    required this.action,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        onTap: action,
      ),
    );
  }
}
