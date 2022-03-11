import 'package:boticario_app/modules/posts/domain/repositories/posts_repository.dart';

import '../models/post_model.dart';

abstract class GetPosts {
  Future<List<PostModel>> call();
}

class GetPostsImpl extends GetPosts {
  final PostsRepository _repository;
  GetPostsImpl(this._repository);

  @override
  Future<List<PostModel>> call() async {
    return await _repository.findAllPosts();
  }
}
