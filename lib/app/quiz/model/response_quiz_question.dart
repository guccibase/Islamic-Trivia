class ResponseQuizQuestion {
  String code;
  String msg;
  List<QuizQuestion> list;

  ResponseQuizQuestion({this.code, this.msg, this.list});

  ResponseQuizQuestion.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['list'] != null) {
      list = new List<QuizQuestion>();
      json['list'].forEach((v) {
        list.add(new QuizQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizQuestion {
  int id;
  String title;
  String image;
  List<String> answers;
  RightAnswer rightAnswer;

  QuizQuestion({this.id, this.title, this.image, this.answers, this.rightAnswer});

  QuizQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    answers = json['answers'].cast<String>();
    rightAnswer = json['right_answer'] != null
        ? new RightAnswer.fromJson(json['right_answer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['answers'] = this.answers;
    if (this.rightAnswer != null) {
      data['right_answer'] = this.rightAnswer.toJson();
    }
    return data;
  }
}

class RightAnswer {
  int answer;
  String explain;

  RightAnswer({this.answer, this.explain});

  RightAnswer.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    explain = json['explain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['explain'] = this.explain;
    return data;
  }
}