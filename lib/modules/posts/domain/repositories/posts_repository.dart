import 'package:boticario_app/modules/posts/domain/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> findAllPosts();
  Future<PostModel> sendPost(PostModel postModel);
}
