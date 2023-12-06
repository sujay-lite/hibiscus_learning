import 'package:hibiscus_learning/app/common/util/extensions.dart';
import 'package:hibiscus_learning/import.dart';

class LibraryController extends GetxController {
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  // List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true).obs;

  static const pageSize = 26;
  var isLoading = false.obs;
  var isSearching = false.obs;
  bool isFirst = false;

  var isChipSelected = 0.obs;
  TextEditingController searchKey = TextEditingController();
  final passwordFocusNode = FocusNode();

  final PagingController<int, ArticleModel> pagingController =
      PagingController(firstPageKey: 0);

  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 3.obs;

  // var isBusy = false.obs;
  var unreadNotificationFlag = false.obs;

  List<String> screensToGo = ['/articletemplate1', '/articeltemplate2'];

  List<String> subContentType = [
    Strings.all,
    'Kidney',
    'Hypothyroidism',
    'Hyperthyroidism',
    'Hypertension',
    'ESRD',
    'Diabetes',
    'Weight',
    'Insulin',
    'Mental health',
    'Obesity'
  ];

  final List<String> contentTitleList = [
    Strings.toxicFoods,
    Strings.selfCare,
    Strings.diabetesTreatment,
    Strings.regularExercise,
    Strings.toxicFoods,
    Strings.selfCare,
    Strings.diabetesTreatment,
    Strings.regularExercise
  ];
  final List<String> contentImageList = [
    AppImages.clToxic,
    AppImages.clSelfCare,
    AppImages.clDiabetes,
    AppImages.clExercise
  ];

  @override
  void onInit() async {
    // isBusy.value = true;

    pagingController.addPageRequestListener((pageKey) {
      getArticles(pageNumber: pageKey);
    });

    // isBusy.value = false;
    super.onInit();
  }

  onSelectedIndexChanged(int index) {
    currentIndex.value = index;
    selectedIndex.value = index;
    pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: const Duration(seconds: 300), curve: Curves.slowMiddle);
  }

  @override
  void onReady() {
    getArticles();
    super.onReady();
  }

  Future<void> getArticles(
      {int pageNumber = 1,
      String filterCategory = "",
      String searchKeyword = ""}) async {
    isLoading.value = true;
    try {
      _apiHelper
          .getArticle(pageNumber, pageSize, filterCategory, searchKeyword)
          .futureValue((value) {
        var articlesResponse = ArticleData.fromJson(value);

        final bool isLastPage = articlesResponse.data!.length < pageSize;

        if (filterCategory != "") {
          clearPageData();
        }
        if (searchKeyword.isNotEmpty) {
          clearPageData();
        }

        // if (isLastPage) {
        pagingController.appendLastPage(articlesResponse.data!.toList());
        // } else {
        //
        //   var nextPage = pageNumber + 1;
        //   pagingController.appendPage(
        //       articlesResponse.data!.toList(), nextPage);
        // }

        print("😰😰😰😰😰😰😰😰😰😰😰😰😰😰${pagingController.value}");
      }, onError: (error) {
        if (kDebugMode) {
          print("Get Articles $error");
        }
      });
    } catch (e) {
      pagingController.error = e;
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  void clearPageData() {
    pagingController.refresh();
  }

  void onSearch(String val) {
    print("$val😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒${searchKey.text}");
    if (val.length > 2) {
      print("😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒");
      clearPageData();
      getArticles(
          pageNumber: 1,
          filterCategory: subContentType[isChipSelected.value],
          searchKeyword: val);
    }
  }

  void onChipSelected(int ind) {
    isChipSelected.value = ind;

    print("🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢${searchKey.text}");
    getArticles(
        pageNumber: 1,
        filterCategory: subContentType[ind],
        searchKeyword: searchKey.text);
  }

  String? isSearchValueValid(String? text) {
    if (text!.isEmpty) {
      return "Search field empty";
    } else {
      return null;
    }
  }
}
