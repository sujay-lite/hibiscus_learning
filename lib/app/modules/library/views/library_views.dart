import 'package:hibiscus_learning/import.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
      init: LibraryController(),
      builder: (controller){
        return SafeArea(
            child:Scaffold(
              backgroundColor: AppColors.kPrimaryColor,
              appBar:
              AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                leading: iosBackButton,
                toolbarHeight: 100,
                title: const Text(Strings.titleLibrary),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 35, color: AppColors.white)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark,size: 35, color: AppColors.white)),
                ],
              ),

              body: Container(
                color: AppColors.kPrimaryColor,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.kBgColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                               Text(Strings.trending,
                                style: Utils.kHeadingTextStyle.copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 110,
                                child: ListView.separated(
                                  itemCount: controller.trendingTitleList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, ind) {
                                    return LibraryCard(
                                      isPinned: ind==0? true: false,
                                      cardTitle: controller.trendingTitleList[ind],
                                      image: controller.trendingImageList[ind],
                                      isCardTypePresent: true,
                                      cardType: controller.trendingTitleTypes[ind]
                                    );
                                  },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 20.0);
                                    }
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.browseContent,
                                style: Utils.kHeadingTextStyle.copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 38,
                                child: ListView.separated(
                                    itemCount: controller.contentType.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, ind) {
                                      return TextChip(
                                        isSelected: ind ==0 ? true : false,
                                        title: controller.contentType[ind],
                                        onClick: (){},
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 15.0);
                                    }
                                ),
                              ),

                              const SizedBox(height: 20),
                              SizedBox(
                                height: 38,
                                child: ListView.separated(
                                    itemCount: controller.subContentType.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, ind) {
                                      return TextChip(
                                        isSelected: ind ==0 ? true : false,
                                        title: controller.subContentType[ind],
                                        onClick: (){},
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 15.0);
                                    }
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child:
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.contentTitleList.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisSpacing: 20,childAspectRatio: 1.6),
                                itemBuilder: (BuildContext context, int index){
                                  return InkWell(
                                    onTap: ()=>Get.toNamed(controller.screensToGo[index%controller.screensToGo.length]),
                                    child: LibraryCard(
                                      isPinned: false,
                                      isCardTypePresent: index<=2 ?true: false,
                                      cardType: index<=2 ?Strings.popular: '',
                                      cardTitle: controller.contentTitleList[index],
                                      image: controller.contentImageList[index%4],
                                    ),
                                  );
                                },
                            ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                bottomNavigationBar: Obx(() => Utils.bottomNavigationBar(
                    controller, controller.unreadNotificationFlag.value))
            )
        );
      },
    );
  }
}