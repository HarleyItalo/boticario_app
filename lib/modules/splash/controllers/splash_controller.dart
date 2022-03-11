import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';
import '../../../common/controllers/base_controller.dart';
import '../../login/domain/user_cases/get_user_logged.dart';

class SplashController extends BaseController {
  final GetUserLogged getUserLogged;

  SplashController(this.getUserLogged);

  @override
  init() async {
    await await Future.delayed(const Duration(seconds: 2));

    final user = await getUserLogged();
    if (user != null) {
      NavigationService.pushNamedAndRemoveUntil(Routes.allPosts);
      return;
    }
    NavigationService.pushNamedAndRemoveUntil(Routes.login);
  }
}
