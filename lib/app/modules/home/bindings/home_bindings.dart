import 'package:hibiscus_learning/import.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}