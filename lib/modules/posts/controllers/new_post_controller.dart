import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:get/get.dart';

import '../domain/user_cases/create_post.dart';

class NewPostsController extends BaseController {
  NewPostsController(this.createPost);
  final CreatePost createPost;
  var content = "".obs;

  setContent(String text) {
    content.value = text;
  }

  sendPost() async {
    loadingState();
    createPost(post: content.value);
    succeedState();
  }

  @override
  init() async {}
}
