import 'package:get/get.dart';

class DependencyService {
  static T instance<T>() {
    return Get.find<T>();
  }

  static void lazyRegister<T>(T instance) {
    Get.lazyPut<T>(() => instance);
  }
}
