import 'package:hibiscus_learning/import.dart';

abstract class Utils {
  static void closeSnackBar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static assetSVGImage(String imagePath,
      {double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
    );
  }

  static assetImage(String imagePath,
      {Color? color, double? height, double? width}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      color: color,
    );
  }

  static void loadingDialog() {
    Utils.closeDialog();
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }



  static void showDialog(
      String? message, {
        String title = Strings.error,
        bool success = false,
        VoidCallback? onTap,
      }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();

          onTap?.call();

          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
        ),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: CustomInkwellWidget.text(
            onTap: () {
              Get.back();

              onTap?.call();
            },
            title: Strings.ok,
          ),
        ),
      );

  static void showIconDialog(
      String title,
      String message, {
        Widget? imageWidget,
        VoidCallback? onTap,
      }) =>
      Get.dialog(
        AlertDialog(
          title:
          imageWidget ?? const Icon(Icons.done), //add your icon/image here
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.w),
              Text(message,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.w),
              CustomTextButton(
                title: Strings.ok,
                onPressed: () {
                  Get.back();

                  onTap?.call();
                },
              ),
            ],
          ),
        ),
        barrierDismissible: false,
      );



  static TextStyle kHeadingTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.kPrimaryColor,
    ),
  );

  static TextStyle kParagraphTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        color: AppColors.kPrimaryColorText, height: 1.5, fontSize: 14),
  );

  static TextStyle kSmallText = GoogleFonts.inter(
    textStyle: const TextStyle(
        color: AppColors.kPrimaryColorText, height: 1.4, fontSize: 12),
  );

  static TextStyle kVerySmallText = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: AppColors.kTierColor,
      fontSize: 9,
    ),
  );

  static bottomNavigationBar(var controller, bool unreadNotificationFlag) =>
      Container(
        color: AppColors.white,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: NavigationBar(
              backgroundColor: AppColors.kPrimaryColor,
              indicatorColor: AppColors.transparent,
              shadowColor: Colors.transparent,
              animationDuration: const Duration(seconds: 0),
              height: 80,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) {
                controller.onSelectedIndexChanged(index);
              },
              destinations: [
                NavigationDestination(
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.home,height: 20, color: AppColors.kSecColor),
                      const SizedBox(height: 5),
                      const Text(
                        "Home",
                        style: TextStyle(color: AppColors.kSecColor),
                      )
                    ],
                  ),
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.home,height: 20, color: AppColors.grey),
                      const SizedBox(height: 5),
                      const Text(
                        "Home",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.progress,height: 20, color: AppColors.kSecColor),
                      const SizedBox(height: 5),
                      const Text(
                        "Progress",
                        style: TextStyle(color: AppColors.kSecColor),
                      )
                    ],
                  ),
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.progress,height: 20, color: AppColors.grey),
                      const SizedBox(height: 5),
                      const Text(
                        "Progress",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.checkIn,height: 20, color: AppColors.kSecColor),
                      const SizedBox(height: 5),
                      const Text(
                        "Check-in",
                        style: TextStyle(color: AppColors.kSecColor),
                      )
                    ],
                  ),
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.checkIn,height: 20, color: AppColors.grey),
                      const SizedBox(height: 5),
                      const Text(
                        "Check-in",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.learn,height: 20, color: AppColors.kSecColor),
                      const SizedBox(height: 5),
                      const Text(
                        "Learn",
                        style: TextStyle(color: AppColors.kSecColor),
                      )
                    ],
                  ),
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.learn,height: 20, color: AppColors.grey),
                      const SizedBox(height: 5),
                      const Text(
                        "Learn",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.more,height: 20, color: AppColors.kSecColor),
                      const SizedBox(height: 5),
                      const Text(
                        "More",
                        style: TextStyle(color: AppColors.kSecColor),
                      )
                    ],
                  ),
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetImage(AppImages.more,height: 20, color: AppColors.grey),
                      const SizedBox(height: 5),
                      const Text(
                        "More",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      );

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void goBackToScreen(String routeName) {
    Get.until(
      (route) => route.settings.name == routeName,
    );
  }
}
