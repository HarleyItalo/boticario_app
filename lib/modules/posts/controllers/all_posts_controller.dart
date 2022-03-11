import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/news/domain/models/news_model.dart';
import 'package:get/get.dart';
import '../../login/domain/user_cases/check_if_is_logged.dart';

class AllPostsController extends BaseController {
  final CheckIfIsLogged checkIfIsLogged;

  AllPostsController(this.checkIfIsLogged);

  var userData = LoginModel().obs;
  var news = NewsModel().obs;

  @override
  init() async {
    loadingState();
    var user = await checkIfIsLogged();
    userData.value = user!;
    succeedState();
  }
}
