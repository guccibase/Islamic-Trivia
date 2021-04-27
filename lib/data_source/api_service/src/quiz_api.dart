import 'package:dio/dio.dart';
import 'package:islamic_trivia/app/trivia/model/response_trivia_question.dart';

class QuizApiService {
  Future<ResponseTriviaQuestion> getListSportQuestion() async {
    try {
      // Response response = await _dio.get("https://jsonblob.com/api/jsonBlob/4f488d11-307a-11eb-83d3-1140910d6286");
      // var data = jsonDecode(response.toString());

      return ResponseTriviaQuestion.fromJson(dataSport);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        return ResponseTriviaQuestion(code: "error", msg: "Timeout");
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        return ResponseTriviaQuestion(code: "error", msg: "Timeout");
      }
      if (e.response != null) {
        return ResponseTriviaQuestion(code: "error", msg: "Erorr");
      } else {
        return ResponseTriviaQuestion(code: "error", msg: e.message);
      }
    }
  }

  var dataSport = {
    "code": "success",
    "msg": "Success!",
    "list": [
      {
        "id": 0,
        "title": "What is Usain Bolt’s 100m world record time?",
        "image": "",
        "answers": [
          "8.59 seconds",
          "9.58 seconds",
          "10.58 seconds",
          "11.58 seconds"
        ],
        "right_answer": {"answer": 1, "explain": ""}
      },
      {
        "id": 1,
        "title":
            "Which England footballer was famously never given a yellow card?",
        "image": "",
        "answers": [
          "Gary Lineker",
          "Wayne Rooney",
          "Gareth Southgate",
          "David Beckham"
        ],
        "right_answer": {"answer": 0, "explain": ""}
      },
      {
        "id": 2,
        "title": "How many world titles has Phil Talyor won in darts?",
        "image": "",
        "answers": ["14", "15", "16", "17"],
        "right_answer": {"answer": 2, "explain": ""}
      },
      {
        "id": 3,
        "title": "The LA Lakers and New York Knicks play which sport?",
        "image": "",
        "answers": ["Football", "Volleyball", "Table tennis", "Basketball"],
        "right_answer": {"answer": 3, "explain": ""}
      },
      {
        "id": 4,
        "title": "Katarina Johnson-Thompson is world champion in which sport?",
        "image": "",
        "answers": ["Basketball", "Football", "Heptathlon", "Golf"],
        "right_answer": {"answer": 2, "explain": ""}
      },
      {
        "id": 5,
        "title": "Which country did F1 legend Ayrton Senna come from?",
        "image": "",
        "answers": ["Canada", "Brazil", "Poland", "Spain"],
        "right_answer": {"answer": 1, "explain": ""}
      },
      {
        "id": 6,
        "title":
            "A penalty in football is taken how many yards away from the goal?",
        "image": "",
        "answers": ["12 yards", "14 yards", "13 yards", "15 yards"],
        "right_answer": {"answer": 0, "explain": ""}
      },
      {
        "id": 7,
        "title": "Who holds the women's record for the 100m sprint?",
        "image": "",
        "answers": [
          "Carmelita JETER",
          "Florence GRIFFITH-JOYNER",
          "Marion JONES",
          "Shelly-Ann FRASER-PRYCE"
        ],
        "right_answer": {"answer": 1, "explain": ""}
      },
      {
        "id": 8,
        "title": "What club were West Ham United founded as?",
        "image": "",
        "answers": [
          "James Ironworks",
          "Thames Gouse",
          "James Gouse",
          "Thames Ironworks"
        ],
        "right_answer": {"answer": 3, "explain": ""}
      },
      {
        "id": 9,
        "title": "Who has scored the most Premier League hat-tricks?",
        "image": "",
        "answers": [
          "Sergio Aguero",
          "Wayne Rooney",
          "Mohamed Salah",
          "Frank Lampard"
        ],
        "right_answer": {"answer": 0, "explain": ""}
      }
    ]
  };
}
