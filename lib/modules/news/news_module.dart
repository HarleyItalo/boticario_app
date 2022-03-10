import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/news/controllers/news_controller.dart';
import 'package:boticario_app/modules/news/views/news_page.dart';

class NewsModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister(
        NewsController(DependencyService.instance()));
    DependencyService.lazyRegister(
        NewsPage(controller: DependencyService.instance()));
  }
}
