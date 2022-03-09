import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/login/login_module.dart';
import 'package:boticario_app/modules/splash/splash_module.dart';
import 'package:dio/dio.dart';

class InitModules {
  init() {
    DependencyService.lazyRegister(Dio());
    DependencyService.lazyRegister<IHttpService>(
        DioHttpService(DependencyService.instance(), urlApi));
    SplashModule().registerModule();
    LoginModule().registerModule();
  }
}
