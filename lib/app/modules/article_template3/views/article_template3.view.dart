import 'package:hibiscus_learning/import.dart';

class ArticleTemplateView3 extends GetView<ArticleTemplateView3> {
  const ArticleTemplateView3({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleTemplate3Controller>(
      init: ArticleTemplate3Controller(),
      builder: (controller){
        return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 210,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                        image: AssetImage(AppImages.clArticle),
                        fit: BoxFit.cover,
                            ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              iosBackButton,
                              SizedBox(width: Get.width-110),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border,size: 35, color: AppColors.white)),
                            ],
                          ),
                    ),

                    Card(
                       color: AppColors.kPrimaryColor,
                       margin: const EdgeInsets.all(0),
                       elevation: 0,
                       shape: const RoundedRectangleBorder(
                         borderRadius: BorderRadius.vertical(top:Radius.circular(10),
                         ),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(top:30, bottom: 20.0,left: 20,right: 20),
                         child: Column(
                           children: [
                             Text(
                               Strings.articleHeading,
                               maxLines: 3,
                               overflow: TextOverflow.ellipsis,
                               style: Utils.kHeadingTextStyle.copyWith(color: AppColors.white,fontSize: 20),
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
                                       style: Utils.kParagraphTextStyle.copyWith(fontWeight: FontWeight.w500,color: AppColors.kGreyText),
                                     ),

                                     Text(
                                       Strings.twoMinsRead,
                                       style: Utils.kParagraphTextStyle.copyWith(color: AppColors.kTierColor),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(height: 20),
                                 const ReviewedByDoctor(doctorImage: AppImages.clDoctorImage,
                                     doctorName: Strings.doctorName,
                                     doctorQualification: Strings.doctorQualification,fontColor: AppColors.kGreyText),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
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
