import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/news/controllers/news_controller.dart';
import 'package:boticario_app/modules/news/domain/repositories/news_repository.dart';
import 'package:boticario_app/modules/news/domain/user_cases/find_news.dart';
import 'package:boticario_app/modules/news/infa/repositories/news_repository.dart';
import 'package:boticario_app/modules/news/views/news_page.dart';

class NewsModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister<NewsRepository>(
        NewsRepositoryImpl(DependencyService.instance()));
    DependencyService.lazyRegister<FindNews>(
        FindNewsImpl(DependencyService.instance()));
    DependencyService.lazyRegister(NewsController(
        DependencyService.instance(), DependencyService.instance()));
    DependencyService.lazyRegister(
        NewsPage(controller: DependencyService.instance()));
  }
}
