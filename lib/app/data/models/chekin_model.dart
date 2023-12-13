import 'package:hibiscus_learning/import.dart';

class CheckInResponse {
  List<CheckInModel>? data;
  Meta? meta;

  CheckInResponse({this.data, this.meta});

  CheckInResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CheckInModel>[];
      json['data'].forEach((v) {
        data!.add(CheckInModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class CheckInModel {
  String? id;
  String? checkinCategory;
  String? question;
  List<String>? options;

  CheckInModel({this.checkinCategory, this.question, this.options});

  CheckInModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checkinCategory = json['checkin_category'];
    question = json['question'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['checkin_category'] = checkinCategory;
    data['question'] = question;
    data['options'] = options;
    return data;
  }
}

var questions = {
  "data": [
    {
      "id": "75",
      "checkin_category": "💪 Energy level",
      "question": "How would you rate your energy levels today?",
      "options": ["Very low", "Low", "Moderate", "High", "Very high"],
    },
    {
      "id": "76",
      "checkin_category": "😊 Mood",
      "question": "How would you rate your overall mood today?",
      "options": ["Happy", "Sad", "Stressed", "Calm", "Anxious"],
    },
    {
      "id": "77",
      "checkin_category": "😊 Mood",
      "question":
          "Over the last 2 weeks, have you been bothered by any of the following problems: little interest or pleasure in doing things, feeling down, depressed or hopeless, or poor appetite or overeating?",
      "options": ["I have been bothered by one or more.", "None of the above."],
    },
    {
      "id": "78",
      "checkin_category": "😴 Sleep",
      "question": "How would you rate your sleep quality last night?",
      "options": [
        "Extremely poor",
        "Fairly poor",
        "Average",
        "Good",
        "Excellent"
      ],
    },
    {
      "id": "79",
      "checkin_category": "🥪 Food",
      "question":
          "Have you experienced any emotional eating in the last 24 hours?",
      "options": ["Yes, several times", "Yes, once or twice", "No"],
    },
    {
      "id": "80",
      "checkin_category": "🏃🏼‍♀️🏃🏼 Activity",
      "question":
          "In the last 24 hours, did you engage in any physical activity?",
      "options": ["Yes", "No"],
    },
  ],
  "meta": {
    "pagination": {"page": 1, "pageSize": 25, "pageCount": 1, "total": 6}
  }
};
