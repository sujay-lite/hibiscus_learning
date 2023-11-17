import 'package:hibiscus_learning/import.dart';

class ArticleTemplateView2 extends GetView<ArticleTemplateView2> {
  const ArticleTemplateView2({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleTemplate2Controller>(
      init: ArticleTemplate2Controller(),
      builder: (controller){
        return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 100,
                backgroundColor: AppColors.kPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                title: const Text('Article'),
                centerTitle: true,
                leading: iosBackButton,
              ),

              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 5),

                     Card(
                       color: AppColors.kSummaryBg,
                       elevation: 0,
                       child:
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Column(
                           children: [
                             Text(
                              Strings.articleHeading,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Utils.kHeadingTextStyle,
                             ),
                             const SizedBox(height: 20),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       Strings.articleBy,
                                       style: Utils.kParagraphTextStyle.copyWith(fontWeight: FontWeight.w600,color: AppColors.kTierColor),
                                     ),

                                     Row(
                                       children: [
                                         Text(
                                           Strings.twoMinsRead,
                                           style: Utils.kParagraphTextStyle.copyWith(color: AppColors.kTierColor),
                                         ),
                                         IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border,size: 25, color: AppColors.kTierColor)),
                                       ],
                                     )
                                   ],
                                 ),
                                 const SizedBox(height: 10),
                                 const ReviewedByDoctor(doctorImage: AppImages.clDoctorImage,
                                     doctorName: Strings.doctorName,
                                     doctorQualification: Strings.doctorQualification),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(AppImages.clArticle),
                          ),

                          const SizedBox(height: 20),
                          Text(
                            Strings.articlePart1,
                            style: Utils.kParagraphTextStyle,
                          ),

                          const SizedBox(height: 15),
                          ArticlePoints(width: Get.width, subheading: Strings.subheading1, content: Strings.subheading1Content),


                          const SizedBox(height: 15),
                          ArticlePoints(width: Get.width, subheading: Strings.subheading2, content: Strings.subheading2Content),

                          const SizedBox(height: 15),
                          Text(
                            Strings.articlePart2,
                            style: Utils.kParagraphTextStyle,
                          ),

                          const SizedBox(height: 20),
                          const ArticleSummary(articleTip: Strings.articleSummary),
                          const SizedBox(height: 15),
                          Text(
                              Strings.articleDisclaimer,
                              style: Utils.kVerySmallText.copyWith(fontStyle: FontStyle.italic)
                          ),
                          const SizedBox(height: 20),
                          Obx(() => InkWell(
                            onTap: controller.toggle,
                            child:Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Strings.references,
                                      style: Utils.kParagraphTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Icon( !controller.isRefCollapsed.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, size: 30,color: AppColors.kPrimaryColorText,),
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
                                          Strings.referenceText,
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
                          ))
                        ],
                      ),
                    )

                  ],
                ),
              ),
                bottomNavigationBar: Obx(() => Utils.bottomNavigationBar(
                    controller, controller.unreadNotificationFlag.value))
          ),
        );
      }
    );
  }
}
