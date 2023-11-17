import 'package:hibiscus_learning/import.dart';

class ArticleTemplate6Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ArticleTemplate2Controller>(() => ArticleTemplate2Controller());
  }
}