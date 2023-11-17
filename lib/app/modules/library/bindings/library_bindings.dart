import 'package:hibiscus_learning/import.dart';

class LibraryBinding extends Bindings {

  @override
  void dependencies(){
    Get.lazyPut<LibraryController>(()=> LibraryController());
  }
}