import '../../import.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const INITIAL =
      //Routes.facialRecognition;
      // Routes.articleTemplate1Screen;
      Routes.libraryScreen;

  static final routes = [
    GetPage(
        name: _Paths.home,
        page: ()=> const HomeView(),
        binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.library,
        page: ()=> const LibraryView(),
        binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.articleTemplate1,
      page: ()=> const ArticleTemplateView1(),
      binding: ArticleTemplate1Binding(),
    ),
    GetPage(
        name: _Paths.articleTemplate2,
        page: ()=> const ArticleTemplateView2(),
        binding: ArticleTemplate2Binding(),
    ),
    GetPage(
        name: _Paths.articleTemplate3,
        page: ()=> const ArticleTemplateView3(),
        binding: ArticleTemplate3Binding(),
    ),
    GetPage(
        name: _Paths.articleTemplate4,
        page: ()=> const ArticleTemplateView4(),
        binding: ArticleTemplate4Binding(),
    ),
    GetPage(
        name: _Paths.articleTemplate5,
        page: ()=>const ArticleTemplateView5(),
        binding: ArticleTemplate5Binding(),
    ),
    GetPage(
        name: _Paths.articleTemplate6,
        page: ()=> const ArticleTemplateView5(),
        binding: ArticleTemplate6Binding(),
    )
  ];
}