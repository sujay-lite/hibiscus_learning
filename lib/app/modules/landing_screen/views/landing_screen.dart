import '../../../../import.dart';

class LandingScreen extends GetView<LandingScreenController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingScreenController>(
        init: LandingScreenController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                  body: WillPopScope(
                    onWillPop: () {
                      return Future.value(true);
                    },
                    child: SizedBox.expand(
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          // controller.onSelectedIndexChanged(index);
                        },
                        children: const <Widget>[
                          LibraryView(),
                          LibraryView(),
                          LibraryView(),
                          LibraryView(),
                          LibraryView(),
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar:
                      Obx(() => Utils.bottomNavigationBar(controller))));
        });
  }
}
