import 'package:boticario_app/modules/news/domain/models/news_model.dart';

abstract class NewsRepository {
  Future<NewsModel> findBoticatioNews();
}
