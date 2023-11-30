import 'package:hibiscus_learning/import.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
      init: LibraryController(),
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.kPrimaryColor,
                appBar: AppBar(
                  backgroundColor: AppColors.kPrimaryColor,
                  leading: iosBackButton,
                  toolbarHeight: 100,
                  title: const Text(Strings.learn),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search,
                            size: 35, color: AppColors.white)),
                  ],
                ),
                body: Container(
                  color: AppColors.kPrimaryColor,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.kBgColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.browseContent,
                                  style: Utils.kHeadingTextStyle
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 38,
                                  child: ListView.separated(
                                      itemCount:
                                          controller.subContentType.length,
                                      scrollDirection: Axis.horizontal,
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, ind) {
                                        return TextChip(
                                          isSelected: ind == 0 ? true : false,
                                          title: controller.subContentType[ind],
                                          onClick: () {},
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(width: 15.0);
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: controller.isLoading.value
                                    ? Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        enabled: true,
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 8,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio: 1.6),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 110,
                                              width: 175,
                                              decoration: BoxDecoration(
                                                color: AppColors.kPrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : PagedGridView<int, ArticleModel>(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    pagingController: controller.pagingController,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 1.6),
                                  builderDelegate: PagedChildBuilderDelegate(
                                  itemBuilder:  (BuildContext context,item, int index) {
                                    return InkWell(
                                      onTap: () => Get.toNamed(
                                          controller.screensToGo[index %
                                              controller.screensToGo.length],
                                          arguments: [
                                            item.attributes
                                            // controller.articleList[index]
                                            //     .attributes
                                          ]),
                                      child: LibraryCard(
                                        cardTitle:
                                            "${item.attributes?.title}",
                                        // "${controller.articleList[index].attributes?.title}",
                                        image: "${item.attributes?.image}"
                                        //"${controller.articleList[index].attributes?.image}",
                                        //controller.contentImageList[index % 4],
                                      ),
                                    );
                                  },
                                ),
                                ),
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
                    controller, controller.unreadNotificationFlag.value))));
      },
    );
  }
}
