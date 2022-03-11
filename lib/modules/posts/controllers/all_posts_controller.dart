import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/modules/posts/domain/models/post_model.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/get_posts.dart';
import 'package:get/get.dart';
import '../../login/domain/user_cases/get_user_logged.dart';
import '../../register_user/domain/models/register_user_model.dart';

class AllPostsController extends BaseController {
  final GetUserLogged getUserLogged;
  final GetPosts getPosts;
  AllPostsController(this.getUserLogged, this.getPosts);

  var userData = UserModel().obs;
  var posts = <PostModel>[].obs;

  @override
  init() async {
    loadingState();
    var user = await getUserLogged();
    userData.value = user!;
    succeedState();
  }
}
