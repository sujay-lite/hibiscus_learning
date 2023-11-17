import 'package:hibiscus_learning/import.dart';

abstract class Utils {

  static void closeSnackBar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static assetSVGImage(String imagePath, {double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
    );
  }

  static assetImage(String imagePath, {Color? color, double? height, double? width}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      color: color,
    );
  }

   static TextStyle kHeadingTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.kPrimaryColor,
    ),
  );

  static TextStyle kParagraphTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: AppColors.kPrimaryColorText,
      height: 1.5,
      fontSize: 14
    ),
  );

  static TextStyle kSmallText = GoogleFonts.inter(
    textStyle: const TextStyle(
        color: AppColors.kPrimaryColorText,
        height: 1.4,
        fontSize: 12
    ),
  );


  static TextStyle kVerySmallText = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: AppColors.kTierColor,
      fontSize: 9,
    ),
  );

  static bottomNavigationBar(var controller, bool unreadNotificationFlag) => Theme(
    data: ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    child:   Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: NavigationBar(
            backgroundColor: AppColors.kPrimaryColor,
            indicatorColor: Colors.transparent,
            shadowColor: Colors.transparent,
            animationDuration: const Duration(seconds: 0),
            height: 80,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.onSelectedIndexChanged(index);
            },
            destinations: [
              NavigationDestination(
                selectedIcon:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    assetImage(AppImages.home),
                    const SizedBox(height: 4),
                    const Text("Home", style: TextStyle(color: Colors.white),)
                  ],
                ),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    assetImage(AppImages.home,color: AppColors.grey),
                    const SizedBox(height: 4),
                    const Text("Home", style: TextStyle(color: Colors.grey),)
                  ],
                ),
                label: '',
              ),
              const NavigationDestination(
                selectedIcon:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_emotions_rounded, size: 30, weight: 30, color: Colors.white),
                    Text("Check in", style: TextStyle(color: Colors.white),)
                  ],
                ),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_emotions_rounded, size: 30, weight: 30, color: Colors.grey,),
                    Text("Check in", style: TextStyle(color: Colors.grey),)
                  ],
                ),
                label: '',
              ),
              NavigationDestination(
                selectedIcon:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    assetImage(AppImages.insight),
                    const SizedBox(height: 4),
                    const Text("Insights", style: TextStyle(color: Colors.white),)
                  ],
                ),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    assetImage(AppImages.insight, color: AppColors.grey),
                    const SizedBox(height: 4),
                    const Text("Insights", style: TextStyle(color: Colors.grey),)
                  ],
                ),
                label: '',
              ),
              NavigationDestination(
                selectedIcon:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    assetImage(AppImages.library),
                    const SizedBox(height: 4),
                    const Text("Library", style: TextStyle(color: Colors.white),)
                  ],
                ),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    assetImage(AppImages.library,color: AppColors.grey),
                    const SizedBox(height: 4),
                    const Text("Library", style: TextStyle(color: Colors.grey),)
                  ],
                ),
                label: '',
              ),
              const NavigationDestination(
                selectedIcon:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle_rounded, size: 30, weight: 30, color: Colors.white),
                    Text("Profile", style: TextStyle(color: Colors.white),)
                  ],
                ),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle_rounded, size: 30, weight: 30, color: Colors.grey),
                    Text("Profile", style: TextStyle(color: Colors.grey),)
                  ],
                ),
                label: '',
              ),
            ],
          ),
        )),
  );

}