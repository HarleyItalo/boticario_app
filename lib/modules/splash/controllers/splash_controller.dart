import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';

import '../../../common/controllers/base_controller.dart';

class SplashController extends BaseController {
  void navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    NavigationService.pushNamedAndRemoveUntil(Routes.login);
  }

  @override
  init() {}
}
