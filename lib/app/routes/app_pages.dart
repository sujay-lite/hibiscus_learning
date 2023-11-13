import '../../import.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.landingScreen;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: ()=> HomeView(),
        binding: HomeBinding(),
    )
  ];
}