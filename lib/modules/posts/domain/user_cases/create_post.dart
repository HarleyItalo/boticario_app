import 'package:boticario_app/modules/login/domain/user_cases/get_user_logged.dart';
import 'package:boticario_app/modules/posts/domain/errors/empty_user_exception.dart';
import 'package:boticario_app/modules/posts/domain/repositories/posts_repository.dart';

import '../models/post_model.dart';

abstract class CreatePost {
  Future<PostModel> call({required String post});
}

class CreatePostImpl extends CreatePost {
  final GetUserLogged getUserLogged;
  final PostsRepository _repository;
  CreatePostImpl(this._repository, this.getUserLogged);

  @override
  Future<PostModel> call({required String post}) async {
    var userModel = await getUserLogged();
    if (userModel == null) {
      throw EmptyUserException();
    }
    var user = User(
      username: userModel.username,
      nome: userModel.nome,
      profilePicture: userModel.profilePicture,
    );
    var postModel = PostModel(
        user: user, content: post, createdAt: DateTime.now().toString());
    return await _repository.insertPost(postModel);
  }
}
