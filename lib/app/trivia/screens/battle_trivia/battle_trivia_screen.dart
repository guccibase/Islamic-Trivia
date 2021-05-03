import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/trivia/model/response_trivia_question.dart';
import 'package:islamic_trivia/app/trivia/screens/quiz_play/page_view_holder.dart';
import 'package:islamic_trivia/app/trivia/screens/quiz_play/quiz_page.dart';
import 'package:islamic_trivia/app/trivia/screens/quiz_play/result_quiz_play.dart';
import 'package:islamic_trivia/app/trivia/screens/widget/countdown_progress.dart';
import 'package:islamic_trivia/data_source/api_service/src/quiz_api.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:provider/provider.dart';

class BattleQuizScreen extends StatefulWidget {
  @override
  _BattleQuizScreenState createState() => _BattleQuizScreenState();
}

class _BattleQuizScreenState extends State<BattleQuizScreen> {
  GlobalKey<CountdownProgressState> countDownKey =
      GlobalKey<CountdownProgressState>();
  int question = 1;
  PageViewHolder holder;
  PageController _pageController = PageController(initialPage: 0);
  int correct1 = 0;
  int correct2 = 0;
  List<bool> yourAnswers = [];
  List<bool> competitorAnswers = [];
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
    return FutureBuilder<ResponseTriviaQuestion>(
        future: QuizApiService().getListTriviaQuestion('Level 1'),
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data.list != null
              ? Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    title: CountdownProgress(
                      key: countDownKey,
                      seconds: 60,
                      onOverTime: () {
                        _getResult(false);
                      },
                    ),
                    centerTitle: true,
                  ),
                  body: _bodyMain(context, snapshot.data.list),
                )
              : Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        });
  }

  _bodyMain(BuildContext context, List<TriviaQuestion> list) {
    return Column(
      children: [
        _player(context),
        _score(context),
        _pageViewQuestion(context, list)
      ],
    );
  }

  _player(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      color: Theme.of(context).backgroundColor, width: 1),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(ImageLinks().avatar).image)),
            ),
            Text(
              "VS",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(
                      color: Theme.of(context).backgroundColor, width: 1),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(ImageLinks().reviewer2).image)),
            )
          ],
        ),
      ),
    );
  }

  _score(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 47),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$correct1",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff00C036),
                fontWeight: FontWeight.w600),
          ),
          Text(
            "${S.current.question} $question :",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            "$correct2",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  _pageViewQuestion(BuildContext context, List<TriviaQuestion> list) {
    return Expanded(
      child: ChangeNotifierProvider<PageViewHolder>.value(
        value: holder,
        child: PageView.builder(
            itemCount: list.length,
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
    );
  }

  onSelected({int length, bool val, Duration duration}) {
    if (question < length) {
      Future.delayed(duration, () {
        _pageController.nextPage(
            duration: Duration(milliseconds: 700), curve: Curves.ease);

        yourAnswers.add(val);
        var rng = new Random();
        competitorAnswers.add(rng.nextBool());
        setState(() {
          question++;
          int c1 = 0;
          int c2 = 0;
          for (var x in yourAnswers) {
            if (x) {
              c1++;
            }
          }
          for (var x in competitorAnswers) {
            if (x) {
              c2++;
            }
          }
          correct1 = c1;
          correct2 = c2;
        });
      });
    } else {
      _getResult(val);
    }
  }

  _getResult(bool val) {
    countDownKey.currentState.cancelTime();
    yourAnswers.add(val);
    var rng = new Random();
    competitorAnswers.add(rng.nextBool());

    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ResultQuizPlay(
                    acquiredPoints: correct1,
                    competitorPoints: correct2,
                  )));
    });
  }
}
