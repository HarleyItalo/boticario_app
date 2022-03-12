import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/posts/controllers/all_posts_controller.dart';
import 'package:boticario_app/modules/posts/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import '../../../common/enuns/controller_state.dart';
import '../../../common/widgets/observable.dart';
import '../../app/routes/routes.dart';
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
      body: RefreshIndicator(
        onRefresh: () => widget.controller.init(),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Posts'),
            ),
            Observable(
              () {
                if (widget.controller.stateEqualsTo(ControllerState.loading)) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var info = widget.controller.posts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PostTile(
                          post: info,
                          controller: widget.controller,
                        ),
                      );
                    },
                    childCount: widget.controller.posts.length,
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 100,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Adicionar novo post',
          onPressed: () {
            NavigationService.pushNamed(Routes.newPost);
          },
          child: const Icon(Icons.add)),
    );
  }
}
