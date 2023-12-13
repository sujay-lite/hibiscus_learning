import 'package:hibiscus_learning/import.dart';

class DailyCheckinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyCheckinController>(() => DailyCheckinController());
  }
}
