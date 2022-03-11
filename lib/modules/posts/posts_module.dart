import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/posts/controllers/all_posts_controller.dart';
import 'package:boticario_app/modules/posts/views/all_posts_page.dart';

class PostsModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister(
        AllPostsController(DependencyService.instance()));
    DependencyService.lazyRegister(AllPostsPage(
      controller: DependencyService.instance(),
    ));
  }
}
