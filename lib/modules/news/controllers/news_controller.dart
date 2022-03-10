import 'package:boticario_app/common/controllers/base_controller.dart';

import '../../login/domain/user_cases/check_if_is_logged.dart';

class NewsController extends BaseController {
  final CheckIfIsLogged checkIfIsLogged;
  NewsController(this.checkIfIsLogged);

  @override
  init() async {
    var user = await checkIfIsLogged();
    print(user);
  }
}
