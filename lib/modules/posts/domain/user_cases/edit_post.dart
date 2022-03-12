import 'package:boticario_app/modules/login/domain/user_cases/get_user_logged.dart';
import 'package:boticario_app/modules/posts/domain/errors/empty_user_exception.dart';
import 'package:boticario_app/modules/posts/domain/repositories/posts_repository.dart';

import '../models/post_model.dart';

abstract class EditPost {
  Future<PostModel> call({required String id, required PostModel post});
}

class EditPostImpl extends EditPost {
  final PostsRepository _repository;
  EditPostImpl(this._repository);

  @override
  Future<PostModel> call({required String id, required PostModel post}) async {
    return await _repository.updatePost(id, post);
  }
}
