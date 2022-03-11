import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/posts/controllers/all_posts_controller.dart';
import 'package:boticario_app/modules/posts/domain/repositories/posts_repository.dart';
import 'package:boticario_app/modules/posts/infra/repositories/posts_repository.dart';
import 'package:boticario_app/modules/posts/views/all_posts_page.dart';

import 'domain/user_cases/get_posts.dart';
import 'views/new_post_page.dart';

class PostsModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister<PostsRepository>(
        PostsRepositoryImpl(DependencyService.instance()));
    DependencyService.lazyRegister<GetPosts>(
        GetPostsImpl(DependencyService.instance()));
    DependencyService.lazyRegister(AllPostsController(
        DependencyService.instance(), DependencyService.instance()));
    DependencyService.lazyRegister(AllPostsPage(
      controller: DependencyService.instance(),
    ));
    DependencyService.lazyRegister(NewPostPage());
  }
}
