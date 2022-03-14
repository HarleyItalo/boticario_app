import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/posts/domain/models/post_model.dart';
import 'package:boticario_app/modules/posts/infra/repositories/posts_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  final dioMock = DioHttpService(dioClient, urlApi);
  final repository = PostsRepositoryImpl(dioMock);

  test("dever cadastrar um novo post e excluir", () async {
    var postModel = PostModel(
        content: "teste", user: User(nome: 'harley', username: "harleyitalo"));

    var result = await repository.insertPost(postModel);

    expect(result.id != null, true);
    expect(await repository.deletePost(result.id!), true);
  });

  test("deve editar um post", () async {
    var postModel = PostModel(
        content: "teste", user: User(nome: 'harley', username: "harleyitalo"));

    var result = await repository.insertPost(postModel);
    result.content = "atualizando um teste";

    var edited = await repository.updatePost(result.id!, result);

    expect(edited.content != null, true);
    expect(await repository.deletePost(result.id!), true);
  });

  test("deve trazer uma lista de posts", () async {
    var posts = await repository.findAllPosts();
    expect(posts, isA<List<PostModel>>());
  });
}
