import 'package:boticario_app/modules/posts/domain/models/post_model.dart';

abstract class PostRepository {
  Future<PostModel> findAllPosts();
}
