import 'package:hibiscus_learning/app/common/util/extensions.dart';
import 'package:hibiscus_learning/import.dart';

class LibraryController extends GetxController {

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  // List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true).obs;

  var isLoading = false.obs;

  final PagingController<int, ArticleModel> pagingController = PagingController(firstPageKey: 0);

  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 3.obs;
  var isBusy = false.obs;
  var unreadNotificationFlag = false.obs;

  List<String> screensToGo = ['/articletemplate1', '/articeltemplate2'];

  List<String> subContentType = [
    Strings.all,
    Strings.diet,
    Strings.medication,
    Strings.bloodSugar,
    Strings.complications,
    Strings.mentalHealth,
    Strings.meditation,
    Strings.pain
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
    isBusy.value = true;

    pagingController.addPageRequestListener((pageKey) {
      getArticles(pageNumber: pageKey);
    });

    isBusy.value = false;
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

  Future<void> getArticles({int pageNumber = 1}) async {
    isLoading.value = true;

    try {
      _apiHelper.getArticle(pageNumber).futureValue(
              (value) {
            var articlesResponse = ArticleData.fromJson(value);

            final bool isLastPage = articlesResponse.data!.length < 25;
            if (isLastPage) {
              pagingController.appendLastPage(articlesResponse.data!.toList());
            } else {
              var nextPage = pageNumber + 1;
              pagingController.appendPage(
                  articlesResponse.data!.toList(), nextPage);
            }

            // articleList.assignAll(articlesResponse.data ?? []);
            isLoading.value = false;
          }, onError: (error) {
        if (kDebugMode) {
          print("Get Articles $error");
        }
      });
    } catch (e){
      pagingController.error = e;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
