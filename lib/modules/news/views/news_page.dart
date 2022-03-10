import 'package:boticario_app/modules/news/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

import '../controllers/news_controller.dart';

class NewsPage extends StatefulWidget {
  final NewsController controller;

  const NewsPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: CustomScrollView(slivers: [
        const SliverAppBar(
          title: Text('Novidades'),
        ),
        SliverList(
          delegate: SliverChildListDelegate([]),
        ),
      ]),
    );
  }
}
