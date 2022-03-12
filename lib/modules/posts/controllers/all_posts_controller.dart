import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/modules/posts/domain/models/post_model.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/delete_post.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/get_posts.dart';
import 'package:get/get.dart';
import '../../login/domain/user_cases/get_user_logged.dart';
import '../../register_user/domain/models/register_user_model.dart';

class AllPostsController extends BaseController {
  final GetUserLogged getUserLogged;
  final GetPosts getPosts;
  final DeletePost deletePost;
  AllPostsController(this.getUserLogged, this.getPosts, this.deletePost);

  var userData = UserModel().obs;
  var posts = <PostModel>[].obs;

  Future<bool> deleteSpecificPost(PostModel post) async {
    if (post.id == null) return false;

    if (await deletePost(id: post.id!)) {
      posts.remove(post);
      return true;
    }
    return false;
  }

  @override
  init() async {
    loadingState();
    var user = await getUserLogged();
    if (user == null) {
      errorState();
      return;
    }
    userData.value = user;
    var allPosts = await getPosts();
    posts.value = allPosts;
    succeedState();
  }
}
