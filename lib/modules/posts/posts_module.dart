import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/posts/controllers/all_posts_controller.dart';
import 'package:boticario_app/modules/posts/controllers/edit_post_controller.dart';
import 'package:boticario_app/modules/posts/controllers/new_post_controller.dart';
import 'package:boticario_app/modules/posts/domain/repositories/posts_repository.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/create_post.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/delete_post.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/edit_post.dart';
import 'package:boticario_app/modules/posts/infra/repositories/posts_repository.dart';
import 'package:boticario_app/modules/posts/views/all_posts_page.dart';
import 'package:boticario_app/modules/posts/views/edit_post_page.dart';

import 'domain/user_cases/get_posts.dart';
import 'views/new_post_page.dart';

class PostsModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister<PostsRepository>(
        PostsRepositoryImpl(DependencyService.instance()));
    DependencyService.lazyRegister<GetPosts>(
        GetPostsImpl(DependencyService.instance()));

    DependencyService.lazyRegister<DeletePost>(DeletePostImpl(
        DependencyService.instance(), DependencyService.instance()));

    DependencyService.lazyRegister(AllPostsController(
        DependencyService.instance(),
        DependencyService.instance(),
        DependencyService.instance()));
    DependencyService.lazyRegister(AllPostsPage(
      controller: DependencyService.instance(),
    ));
    DependencyService.lazyRegister<CreatePost>(CreatePostImpl(
        DependencyService.instance(), DependencyService.instance()));
    DependencyService.lazyRegister(
        NewPostsController(DependencyService.instance()));
    DependencyService.lazyRegister(NewPostPage(
      allPostsController: DependencyService.instance(),
      controller: DependencyService.instance(),
    ));
    DependencyService.lazyRegister<EditPost>(
        EditPostImpl(DependencyService.instance()));
    DependencyService.lazyRegister(
        EditPostController(DependencyService.instance()));
    DependencyService.lazyRegister(EditPostPage(
      allPostsController: DependencyService.instance(),
      controller: DependencyService.instance(),
    ));
  }
}
