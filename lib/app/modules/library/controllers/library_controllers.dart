import 'package:hibiscus_learning/import.dart';

class LibraryController extends GetxController {

  final double height = Get.height;
  final double width = Get.width;

  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 3.obs;
  var isBusy = false.obs;
  var unreadNotificationFlag = false.obs;

  List<String> screensToGo = ['/articletemplate1','/articeltemplate2','/articletemplate3','/articletemplate4','/articletemplate5'];


  List<String> contentType = [Strings.shorts,Strings.articles, Strings.audioClips, Strings.live];

  List<String> subContentType = [Strings.all, Strings.diet, Strings.medication, Strings.bloodSugar, Strings.complications, Strings.mentalHealth, Strings.meditation, Strings.pain];

  final List<String> trendingTitleList = [Strings.meditationTips,Strings.eatingHealthy, Strings.diabetesTreatment, Strings.regularExercise];
  final List<String> trendingTitleTypes = [Strings.video, Strings.audio, Strings.articles, Strings.shorts];
  final List<String> trendingImageList = [AppImages.clMeditation, AppImages.clEating, AppImages.clDiabetes, AppImages.clExercise];
  final List<String> contentTitleList = [Strings.toxicFoods,Strings.selfCare, Strings.diabetesTreatment, Strings.regularExercise, Strings.toxicFoods, Strings.selfCare,Strings.diabetesTreatment, Strings.regularExercise];
  final List<String> contentImageList = [AppImages.clToxic, AppImages.clSelfCare,AppImages.clDiabetes, AppImages.clExercise];

  final List<String> contentTypes = [Strings.shorts, Strings.articles, Strings.audioClips, Strings.live];

  final List<String> subContentTypes = [Strings.all, Strings.diet, Strings.medication, Strings.bloodSugar, Strings.complications, Strings.complications, Strings.mentalHealth, Strings.medication, Strings.pain];


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
}