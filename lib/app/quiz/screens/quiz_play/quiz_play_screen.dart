import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/quiz/model/response_quiz_question.dart';
import 'package:islamic_trivia/app/quiz/screens/quiz_play/quiz_page.dart';
import 'package:islamic_trivia/app/quiz/screens/widget/countdown_progress.dart';
import 'package:islamic_trivia/data_source/api_service/src/quiz_api.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'page_view_holder.dart';
import 'progress_question.dart';
import 'result_quiz_play.dart';

class QuizPlayScreen extends StatefulWidget {
  final int totalQuestions;

  const QuizPlayScreen({Key key, this.totalQuestions}) : super(key: key);
  @override
  _QuizPlayScreenState createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  PageViewHolder holder;
  PageController _pageController = PageController(initialPage: 0);
  int question = 1;
  GlobalKey<CountdownProgressState> countDownKey =
      GlobalKey<CountdownProgressState>();
  List<bool> answers = [];
  @override
  void initState() {
    holder = PageViewHolder(0);
    _pageController.addListener(() {
      holder.setValue(_pageController.page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseQuizQuestion>(
        future: QuizApiService().getListSportQuestion(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    title: CountdownProgress(
                      key: countDownKey,
                      seconds: 30,
                      onOverTime: () {
                        onSelected(
                            length: snapshot.data.list.length,
                            val: false,
                            duration: Duration(milliseconds: 10));
                      },
                    ),
                    centerTitle: true,
                  ),
                  body: _bodyMain(context, snapshot.data.list),
                )
              : Container(
                  color: Theme.of(context).backgroundColor,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        });
  }

  _bodyMain(
    BuildContext context,
    List<QuizQuestion> list,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${S.current.question} $question",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "/${list.length}",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ProgressQuestion(
            count: question,
            questionLength: list.length,
          ),
        ),
        Expanded(
          child: ChangeNotifierProvider<PageViewHolder>.value(
            value: holder,
            child: PageView.builder(
                itemCount: widget.totalQuestions,
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return QuizPage(
                    index: index,
                    listQuiz: list[index],
                    onSelected: (val) {
                      onSelected(
                          length: list.length,
                          val: val,
                          duration: Duration(milliseconds: 800));
                    },
                    onSkip: () {
                      onSelected(
                          length: list.length,
                          val: false,
                          duration: Duration(milliseconds: 10));
                    },
                  );
                }),
          ),
        )
      ],
    );
  }

  onSelected({int length, bool val, Duration duration}) {
    if (question < length) {
      Future.delayed(duration, () {
        _pageController.nextPage(
            duration: Duration(milliseconds: 700), curve: Curves.ease);
        setState(() {
          question++;
        });
        answers.add(val);
        countDownKey.currentState.reSetTime();
      });
    } else {
      countDownKey.currentState.cancelTime();
      answers.add(val);
      int correct = 0;
      for (var x in answers) {
        if (x) {
          correct++;
        }
      }
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResultQuizPlay(
                      correct: correct,
                      length: length,
                    )));
      });
    }
  }
}
