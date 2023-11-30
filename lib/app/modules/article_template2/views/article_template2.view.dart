import 'package:hibiscus_learning/import.dart';

class ArticleTemplateView2 extends GetView<ArticleTemplateView2> {
  const ArticleTemplateView2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleTemplate2Controller>(
        init: ArticleTemplate2Controller(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 100,
                  backgroundColor: AppColors.kPrimaryColor,
                  elevation: 0,
                  // shape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.vertical(
                  //     bottom: Radius.circular(20),
                  //   ),
                  // ),
                  title: const Text('Article'),
                  centerTitle: true,
                  leading: iosBackButton,
                ),
                body: Container(
                  color: AppColors.kPrimaryColor,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.kBgColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Card(
                              color: AppColors.kSummaryBg,
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.article.title}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Utils.kHeadingTextStyle,
                                    ),
                                    const SizedBox(height: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              Strings.articleBy,
                                              style: Utils.kParagraphTextStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          AppColors.kTierColor),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${controller.article.readTime}",
                                                  style: Utils
                                                      .kParagraphTextStyle
                                                      .copyWith(
                                                          color: AppColors
                                                              .kTierColor),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.bookmark_border,
                                                        size: 25,
                                                        color: AppColors
                                                            .kTierColor)),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        ReviewedByDoctor(
                                          doctorImage:
                                              "${controller.article.reviewerImageResponse?.data?.first.attributes?.formats?.thumbnail?.url}",
                                          doctorName:
                                              "${controller.article.reviewerName}",
                                          doctorQualification:
                                              "${controller.article.reviewerExperience}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: controller.article.image != null
                                          ? Image.network(
                                              controller.article.image!,
                                              height: 200,
                                              width: Get.width,
                                              fit: BoxFit.cover,
                                            )
                                          : const SizedBox()
                                      //Image.asset(AppImages.clArticle),
                                      ),

                                  const SizedBox(height: 20),
                                  controller.article.introduction != null ?
                                  Text(
                                    "${controller.article.introduction}",
                                    //Strings.articlePart1,
                                    style: Utils.kParagraphTextStyle,
                                  ): const SizedBox(),

                                  const SizedBox(height: 15),

                                  controller.article.bulletPoints != null ||
                                      controller.article.bulletPoints != [] ?
                                 ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .article.bulletPoints?.length ?? 0,
                                          itemBuilder: (context, i) {
                                            return ArticlePoints(
                                                width: Get.width,
                                                subheading: "${controller.article.bulletPoints?[i].title}",
                                                content:
                                                "${controller.article.bulletPoints?[i].description}");
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  const SizedBox(height: 15),
                                        ): const SizedBox(),

                                  controller.article.titleBulletPoint != null ||
                                      controller.article.titleBulletPoint != []
                                      ? ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .article.titleBulletPoint?.length ?? 0,
                                          itemBuilder: (context, ind) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.article.titleBulletPoint?[ind].mainTitle}",
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Utils
                                                      .kParagraphTextStyle
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                const SizedBox(height: 10),
                                                ListView.separated(
                                                        itemCount: controller
                                                            .article
                                                            .titleBulletPoint![
                                                                ind]
                                                            .bulletPoint!
                                                            .length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ArticlePoints(
                                                              width: Get.width,
                                                              subheading:
                                                                  "${controller.article.titleBulletPoint![ind].bulletPoint![index].title}",
                                                              // Strings.article5Subpart3Headings[index],
                                                              content:
                                                                  "${controller.article.titleBulletPoint![ind].bulletPoint![index].description}",
                                                              extraSpaceForSubpoint:
                                                                  true);
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return const SizedBox(
                                                              height: 10);
                                                        },
                                                      ),
                                                const SizedBox(height: 20),
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  const SizedBox(),
                                        ) : const SizedBox(),

                                  const SizedBox(height: 20),

                                  controller.article.summary != null || controller.article.summary != ""
                                      ? Text(
                                          "${controller.article.conclusion}",
                                          //Strings.articlePart1,
                                          style: Utils.kParagraphTextStyle,
                                        )
                                      : const SizedBox(),

                                  const SizedBox(height: 20),
                                  ArticleSummary(
                                      articleTip: controller.article.summary!.isNotEmpty || controller.article.summary != "null"  || controller.article.summary!=""
                                          ? "${controller.article.summary}"
                                          : "${controller.article.conclusion}"),
                                  const SizedBox(height: 15),
                                  Text("${controller.article.disclaimer}",
                                      style: Utils.kVerySmallText.copyWith(
                                          fontStyle: FontStyle.italic)),
                                  const SizedBox(height: 20),
                                  controller.refText != "" ?
                                  Obx(() => InkWell(
                                    onTap: controller.toggle,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              Strings.references,
                                              style: Utils.kParagraphTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              controller.isRefCollapsed.value
                                                  ? Icons.keyboard_arrow_down
                                                  : Icons.keyboard_arrow_right,
                                              size: 30,
                                              color: AppColors.kPrimaryColorText,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Visibility(
                                          visible: controller.isRefCollapsed.value,
                                          child: Card(
                                            color: AppColors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            elevation: 0,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: SizedBox(
                                                width: 350,
                                                child: Text(
                                                  controller.refText,
                                                  maxLines: 20,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Utils.kVerySmallText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                      ],
                                    ),
                                  )) : const SizedBox(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          )
          );
        });
  }
}
