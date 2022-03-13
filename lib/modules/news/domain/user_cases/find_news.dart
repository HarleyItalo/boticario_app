import 'package:boticario_app/modules/news/domain/repositories/news_repository.dart';

import '../models/news_model.dart';

abstract class FindNews {
  Future<NewsModel> call();
}

class FindNewsImpl extends FindNews {
  final NewsRepository _repository;
  FindNewsImpl(this._repository);

  @override
  Future<NewsModel> call() async {
    try {
      return await _repository.findBoticatioNews();
    } catch (e) {
      return NewsModel();
    }
  }
}
