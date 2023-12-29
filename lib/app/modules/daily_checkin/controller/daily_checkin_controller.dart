import 'package:hibiscus_learning/app/common/util/extensions.dart';
import 'package:hibiscus_learning/import.dart';

class DailyCheckinController extends GetxController {
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  List<CheckInModel> checkInQuestions =
      List<CheckInModel>.empty(growable: true).obs;

  List<String> answers = List<String>.empty(growable: true).obs;

  static const pageSize = 20;
  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = 100.obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    getQuestions();
    super.onInit();
  }

  Future<void> getQuestions() async {
    checkInQuestions.addAll(CheckInResponse.fromJson(questions).data ?? []);
  }

  void postAnswers() async {
    List<AnswerModel> modelAnswers = [];

    for (int i = 0; i < answers.length; i++) {
      modelAnswers
          .add(AnswerModel(qid: checkInQuestions[i].id, answer: answers[i]));
    }

    isLoading.value = true;
    try {
      _apiHelper
          .postCheckInAnswers(AnswerResponse(
        uid: " GET THE UID FROM THE STORAGE",
        response: modelAnswers,
      ))
          .futureValue((value) {
        print("😴😴😴😴😴😴😴😴$value");
        isLoading.value = false;
      }, onError: (error) {
        print("Daily checkin response error $error");
        isLoading.value = false;
      });
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
