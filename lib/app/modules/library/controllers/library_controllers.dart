import 'package:hibiscus_learning/app/common/util/extensions.dart';
import 'package:hibiscus_learning/import.dart';

class LibraryController extends GetxController {

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true).obs;

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
    pageController = PageController(initialPage: 0);
    isBusy.value = false;
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
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

  Future<void> getArticles() async {
    _apiHelper.getArticle().futureValue(
            (value) {
      var articlesResponse = ArticleData.fromJson(value);

      articleList.assignAll(articlesResponse.data ?? []);
    }, onError : (error) {
      if (kDebugMode) {
        print("Get Articles $error");
      }
    });
  }


}
