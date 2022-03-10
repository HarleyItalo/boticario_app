import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';

import '../../../common/controllers/base_controller.dart';
import '../../login/domain/user_cases/check_if_is_logged.dart';

class SplashController extends BaseController {
  final CheckIfIsLogged checkIfIsLogged;

  SplashController(this.checkIfIsLogged);

  @override
  init() async {
    await await Future.delayed(const Duration(seconds: 2));

    final user = await checkIfIsLogged();
    if (user != null) {
      NavigationService.pushNamedAndRemoveUntil(Routes.news);
      return;
    }
    NavigationService.pushNamedAndRemoveUntil(Routes.login);
  }
}
