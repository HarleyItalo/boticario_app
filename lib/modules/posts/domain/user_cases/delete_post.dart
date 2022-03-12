import 'package:boticario_app/modules/login/domain/user_cases/get_user_logged.dart';
import 'package:boticario_app/modules/posts/domain/repositories/posts_repository.dart';

abstract class DeletePost {
  Future<bool> call({required String id});
}

class CreatePostImpl extends DeletePost {
  final GetUserLogged getUserLogged;
  final PostsRepository _repository;
  CreatePostImpl(this._repository, this.getUserLogged);

  @override
  Future<bool> call({required String id}) async {
    return await _repository.deletePost(id);
  }
}
