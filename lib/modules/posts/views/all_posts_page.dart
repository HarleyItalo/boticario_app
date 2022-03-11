import 'package:boticario_app/modules/posts/controllers/all_posts_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';

class AllPostsPage extends StatefulWidget {
  final AllPostsController controller;
  const AllPostsPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<AllPostsPage> createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(
        controller: widget.controller,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Posts'),
          ),
          SliverToBoxAdapter(
            child: Text(
              'a',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Adicionar novo post',
          onPressed: () {},
          child: const Icon(Icons.add)),
    );
  }
}
