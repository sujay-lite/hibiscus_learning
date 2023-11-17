import 'package:hibiscus_learning/import.dart';

class ArticleTemplate5Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ArticleTemplate5Controller>(() => ArticleTemplate5Controller());
  }
}