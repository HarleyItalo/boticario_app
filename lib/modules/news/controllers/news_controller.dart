import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/modules/news/domain/models/news_model.dart';
import 'package:boticario_app/modules/register_user/domain/models/register_user_model.dart';
import 'package:get/get.dart';
import '../../login/domain/user_cases/get_user_logged.dart';
import '../domain/user_cases/find_news.dart';

class NewsController extends BaseController {
  final GetUserLogged getUserLogged;
  final FindNews findNews;
  NewsController(this.getUserLogged, this.findNews);

  var userData = UserModel().obs;
  var news = NewsModel().obs;

  @override
  init() async {
    loadingState();
    var user = await getUserLogged();
    if (user == null) {
      return;
    }
    userData.value = user;
    var responseNews = await findNews();
    news.value = responseNews;
    succeedState();
  }
}
