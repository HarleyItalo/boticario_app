import 'package:boticario_app/modules/posts/domain/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> findAllPosts();
  Future<PostModel> insertPost(PostModel postModel);
  Future<PostModel> updatePost(String id, PostModel postModel);
  Future<bool> deletePost(String id);
}
