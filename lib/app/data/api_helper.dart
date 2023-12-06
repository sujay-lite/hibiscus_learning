import 'package:hibiscus_learning/import.dart';

abstract class ApiHelper {
  Future<Response> getArticle(int pageNumber, int pageSize,
      String filterCategory, String searchKeyword);
}
