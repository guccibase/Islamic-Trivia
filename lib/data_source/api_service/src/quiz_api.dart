import 'package:islamic_trivia/app/trivia/model/response_trivia_question.dart';
import 'package:islamic_trivia/data_source/trivia_data/questions.dart';

class QuizApiService {
  Future<ResponseTriviaQuestion> getListTriviaQuestion(String level) async {
    try {
      // print(triviaQuestions[level]['questions']);
      return ResponseTriviaQuestion.fromJson(triviaQuestions[level]);
    } catch (e) {
      return ResponseTriviaQuestion(code: "error", msg: "Timeout");
    }
  }
}
