import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/posts/domain/models/post_model.dart';

import '../../domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl(this._httpService);
  final IHttpService _httpService;
  @override
  Future<PostModel> sendPost(PostModel postModel) async {
    var result = await _httpService.post('posts', postModel);
    return PostModel.fromJson(result);
  }

  @override
  Future<List<PostModel>> findAllPosts() async {
    var result = await _httpService.get('posts');
    var itens = <PostModel>[];
    if (result is List) {
      for (var element in result) {
        itens.add(PostModel.fromJson(element));
      }
    }
    return itens;
  }
}
