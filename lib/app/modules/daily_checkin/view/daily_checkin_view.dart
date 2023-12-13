import 'package:hibiscus_learning/import.dart';

class DailyCheckinView extends GetView<DailyCheckinController> {
  const DailyCheckinView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyCheckinController>(
      init: DailyCheckinController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: controller.checkInQuestions.length ?? 0,
                    itemBuilder: (context, ind) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Obx(
                          () => Visibility(
                            visible:
                                controller.currentQuestionIndex.value == ind,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 60),
                                StepProgressIndicator(
                                  totalSteps:
                                      controller.checkInQuestions.length ?? 1,
                                  currentStep: ind + 1,
                                  selectedColor: AppColors.kSecColor,
                                  unselectedColor: AppColors.grey,
                                  padding: 7,
                                  size: 3,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  Strings.dailyCheckIn,
                                  style: Utils.kParagraphTextStyle.copyWith(
                                      color: AppColors.white, fontSize: 17),
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  height: 50,
                                  width: Get.width / 2.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.grey.withOpacity(0.5)),
                                  child: Center(
                                    child: Text(
                                      "${controller.checkInQuestions[ind].checkinCategory}",
                                      style: Utils.kParagraphTextStyle
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Text(
                                  "${controller.checkInQuestions[ind].question}",
                                  style: Utils.kVeryLargeText
                                      .copyWith(color: AppColors.white),
                                ),
                                const SizedBox(height: 30),
                                Wrap(
                                  children: List.generate(
                                    //TODO:Change the index acc to the current question
                                    controller.checkInQuestions[ind].options
                                            ?.length ??
                                        0,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Obx(
                                        () => Theme(
                                          data: ThemeData(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              // TODO: SELECT THE ANS FOR THE GIVEN QUESTION AND SAVE IT IN A LIST
                                              if (controller.answers.length ==
                                                  ind + 1) {
                                                controller
                                                    .answers[ind] = controller
                                                        .checkInQuestions[ind]
                                                        .options?[index] ??
                                                    "";
                                              } else {
                                                controller.answers.add(
                                                    controller
                                                            .checkInQuestions[
                                                                ind]
                                                            .options?[index] ??
                                                        "");
                                              }

                                              controller.selectedOptionIndex
                                                  .value = index + 1;
                                            },
                                            child: Card(
                                              elevation: 0,
                                              color:
                                                  controller.selectedOptionIndex
                                                                  .value -
                                                              1 ==
                                                          index
                                                      ? AppColors.kTierColor
                                                      : AppColors.kTierColor
                                                          .withOpacity(0.2),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0,
                                                        horizontal: 25),
                                                child: Text(
                                                  "${controller.checkInQuestions[ind].options?[index]}",
                                                  style: Utils
                                                      .kParagraphTextStyle
                                                      .copyWith(
                                                          color:
                                                              AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Obx(
                    () => Positioned(
                      bottom: 30,
                      child: InkWell(
                        onTap: controller.currentQuestionIndex.value ==
                                    controller.checkInQuestions.length - 1 ||
                                controller.selectedOptionIndex.value == 100
                            ? null
                            : () {
                                controller.selectedOptionIndex.value = 100;
                                controller.currentQuestionIndex.value++;
                              },
                        child: CustomButtons(
                          weight: Get.width - 40,
                          height: 50,
                          color: controller.selectedOptionIndex.value == 100 ||
                                  controller.currentQuestionIndex.value ==
                                      controller.checkInQuestions.length - 1
                              ? AppColors.kSecColor.withOpacity(0.2)
                              : AppColors.kSecColor,
                          shadowColor: AppColors.transparent,
                          borderRadius: 10,
                          title: Strings.next,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.kPrimaryColor,
                          withShadow: false,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
