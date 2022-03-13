import 'package:flutter/material.dart';

class NoPosts extends StatelessWidget {
  const NoPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const Icon(
            Icons.clear,
            size: 50,
          ),
          Text(
            'Sem posts',
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
