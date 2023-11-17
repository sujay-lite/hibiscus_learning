import 'package:hibiscus_learning/import.dart';

class ArticleTemplate4Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ArticleTemplate4Controller>(() => ArticleTemplate4Controller());
  }
}