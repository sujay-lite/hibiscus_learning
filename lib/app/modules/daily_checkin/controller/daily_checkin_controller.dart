import 'package:hibiscus_learning/import.dart';

class DailyCheckinController extends GetxController {
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  List<CheckInModel> checkInQuestions =
      List<CheckInModel>.empty(growable: true).obs;

  List<String> answers = List<String>.empty(growable: true).obs;

  static const pageSize = 20;
  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = 100.obs;

  @override
  void onInit() {
    getQuestions();
    super.onInit();
  }

  Future<void> getQuestions() async {
    checkInQuestions.addAll(CheckInResponse.fromJson(questions).data ?? []);
  }

  // Future
}
