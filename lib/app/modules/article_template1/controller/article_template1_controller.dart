import 'package:hibiscus_learning/import.dart';

class ArticleTemplate1Controller extends GetxController {
  var isRefCollapsed = true.obs;

  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 3.obs;
  var isBusy = false.obs;
  var unreadNotificationFlag = false.obs;


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

  toggle() {
    isRefCollapsed.value = !isRefCollapsed.value;
  }
}