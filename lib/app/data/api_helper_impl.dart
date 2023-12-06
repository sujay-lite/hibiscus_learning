import 'package:hibiscus_learning/import.dart';

class ApiHelperImpl extends GetConnect implements ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      printInfo(
        info: 'Status Code: ${response.statusCode}\n'
            // TODO: CHANGED HERE
            'Data: ${response.bodyString?.toString() ?? ''}',
      );
      return response;
    });
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response<dynamic>> getArticle(int pageNumber, int pageSize,
      String filterCategory, String searchKeyword) {
    final queryParameters = {
      "populate": "deep",
      'pagination[page]': pageNumber.toString(),
      'pagination[pageSize]': pageSize.toString(),
      if (searchKeyword.isNotEmpty)
        'filters[Title][\$containsi]': searchKeyword,
      if (filterCategory.isNotEmpty && filterCategory.toLowerCase() != "all")
        'filters[Category][\$containsi]': filterCategory
    };
    return get(Constants.articleUrl, query: queryParameters);
  }

  @override
  Future<Response<dynamic>> getCategories(){
    final queryParam = {
      'fields[1]':'category_name'
    };

    return get(Constants.categoryUrl, query: queryParam);
  }
}
