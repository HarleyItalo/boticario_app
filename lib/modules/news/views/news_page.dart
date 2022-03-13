import 'package:boticario_app/common/enuns/controller_state.dart';
import 'package:boticario_app/common/widgets/observable.dart';
import 'package:boticario_app/modules/news/widgets/empty_news.dart';
import 'package:boticario_app/modules/news/widgets/news_tile.dart';
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
    super.initState();
    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => widget.controller.init(),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Novidades'),
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

                if (widget.controller.news.value.news == null) {
                  return const SliverToBoxAdapter(child: EmptyNews());
                }

                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  var info = widget.controller.news.value.news?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsTile(
                      news: info!,
                    ),
                  );
                }, childCount: widget.controller.news.value.news?.length ?? 0));
              },
            ),
          ],
        ),
      ),
    );
  }
}
