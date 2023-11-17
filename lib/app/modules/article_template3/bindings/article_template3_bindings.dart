import 'package:hibiscus_learning/import.dart';

class ArticleTemplate3Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ArticleTemplate3Controller>(() => ArticleTemplate3Controller());
  }
}