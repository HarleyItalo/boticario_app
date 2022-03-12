import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/modules/posts/domain/models/post_model.dart';
import 'package:boticario_app/modules/posts/domain/user_cases/edit_post.dart';
import 'package:get/get.dart';

class EditPostController extends BaseController {
  EditPostController(this.editPost);
  final EditPost editPost;

  var post = PostModel().obs;

  setContent(String text) {
    post.value.content = text;
  }

  get postContent => post.value.content;

  setPost(PostModel retrievedPost) {
    post.value = retrievedPost;
  }

  submitEdit() async {
    loadingState();
    if (post.value.id == null) {
      errorState();
      return;
    }
    var edited = await editPost(id: post.value.id!, post: post.value);
    succeedState();
    return edited;
  }

  @override
  init() async {}
}
