import 'package:hibiscus_learning/import.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  void incrementCounter() {
    counter.value++;

    if(kDebugMode){
      print("Test Purpose only");
    }
  }

  void decrementCounter() {
    counter.value !=0 ? counter.value-- : counter.value;
  }
}