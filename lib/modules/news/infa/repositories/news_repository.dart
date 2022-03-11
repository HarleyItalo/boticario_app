import 'package:boticario_app/modules/news/domain/models/news_model.dart';
import '../../../../common/services/http_service.dart';
import '../../domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final IHttpService _httpService;

  NewsRepositoryImpl(this._httpService);

  @override
  Future<NewsModel> findBoticatioNews() async {
    var response = await _httpService.getWithoutBaseUrl(
        "https://gb-mobile-app-teste.s3.amazonaws.com/data.json");
    return NewsModel.fromJson(response);
  }
}
