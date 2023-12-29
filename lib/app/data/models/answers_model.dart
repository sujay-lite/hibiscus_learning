class AnswerResponse {
  String? uid;
  List<AnswerModel>? response;

  AnswerResponse({this.uid, this.response});

  AnswerResponse.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    if (json['response'] != null) {
      response = <AnswerModel>[];
      json['response'].forEach((v) {
        response!.add(AnswerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswerModel {
  String? qid;
  String? answer;

  AnswerModel({this.qid, this.answer});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    qid = json['qid'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qid'] = qid;
    data['answer'] = answer;
    return data;
  }
}

var response = {
  "uid": "bjds398y3884b",
  "response": [
    {"qid": "75", "answer": "High"},
    {"qid": "76", "answer": "Calm"},
    {"qid": "77", "answer": "None of the above"},
    {"qid": "78", "answer": "Fairly poor"},
    {"qid": "79", "answer": "No"},
    {"qid": "80", "answer": "Yes"}
  ]
};
