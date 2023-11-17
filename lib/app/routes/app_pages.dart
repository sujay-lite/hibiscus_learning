import '../../import.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const INITIAL =
      // Routes.articleTemplate3Screen;
      Routes.libraryScreen;
      //Routes.landingScreen;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: ()=> const HomeView(),
        binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.LIBRARY,
        page: ()=> const LibraryView(),
        binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLETEMPLATE1,
      page: ()=> const ArticleTemplateView1(),
      binding: ArticleTemplate1Binding(),
    ),
    GetPage(
        name: _Paths.ARTICLETEMPLATE2,
        page: ()=> const ArticleTemplateView2(),
        binding: ArticleTemplate2Binding(),
    ),
    GetPage(
        name: _Paths.ARTICLETEMPLATE3,
        page: ()=> const ArticleTemplateView3(),
        binding: ArticleTemplate3Binding(),
    ),
    GetPage(
        name: _Paths.ARTICLETEMPLATE4,
        page: ()=> const ArticleTemplateView4(),
        binding: ArticleTemplate4Binding(),
    ),
    GetPage(
        name: _Paths.ARTICLETEMPLATE5,
        page: ()=>const ArticleTemplateView5(),
        binding: ArticleTemplate5Binding(),
    ),
    GetPage(
        name: _Paths.ARTICLETEMPLATE6,
        page: ()=> const ArticleTemplateView5(),
        binding: ArticleTemplate6Binding(),
    ),
  ];
}