import 'package:hibiscus_learning/import.dart';

class ArticleTemplateView4 extends GetView<ArticleTemplateView4> {
  const ArticleTemplateView4({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleTemplate4Controller>(
      init: ArticleTemplate4Controller(),
      builder: (controller){
        return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: AppColors.kPrimaryColor,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              iosBackButton,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Strings.twoMinsRead,
                                    style: Utils.kParagraphTextStyle.copyWith(color: AppColors.kTierColor),
                                  ),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border,size: 35, color: AppColors.kTierColor)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Text(
                            Strings.title,
                            style: Utils.kVerySmallText.copyWith(color: AppColors.grey),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: Get.width-30,
                            child: Text(
                              Strings.articleHeading,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Utils.kHeadingTextStyle.copyWith(color: AppColors.white,fontSize: 22,fontWeight: FontWeight.w300, height: 1.6),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:170,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Strings.writtenBy,
                                          style: Utils.kSmallText.copyWith(color: AppColors.kGreyText,fontSize: 10, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          Strings.articleBy,
                                          style: Utils.kSmallText.copyWith(color: AppColors.kGreyText),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Strings.reviewedBy,
                                        style: Utils.kSmallText.copyWith(color: AppColors.kGreyText,fontSize: 10, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      const ReviewedByDoctor(
                                        isReviewedByPresent: false,
                                          doctorImage: AppImages.clDoctorImage,
                                          doctorName: Strings.doctorName,
                                          doctorQualification: Strings.doctorQualification,
                                        qualificationWidth: 150,
                                        fontColor: AppColors.kGreyText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [

                          const SizedBox(height: 20),
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
                    ),
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
