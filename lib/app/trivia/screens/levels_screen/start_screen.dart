import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/trivia/screens/quiz_play/quiz_play_screen.dart';
import 'package:islamic_trivia/data_source/assets_link/assets_links.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:islamic_trivia/widget/main_button.dart';

class StartScreen extends StatelessWidget {
  final String title;
  final int levelIndex;
  final String nextLevel;

  const StartScreen({Key key, this.title, this.levelIndex, this.nextLevel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(title),
      ),
      body: _bodyMain(context),
    );
  }

  _bodyMain(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Topic - '),
              Text('Qur\'an'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                'Anything that is related to the Quran, from its content,'
                ' to its revelation or its reasons, to the virtues of the surahs,'
                ' or anything related to the Quran in any way.'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Number of questions - '),
                Text(' 5 '),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Maximum points attainable - '),
                Text('150 Points'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Minimum points required - '),
                Text('100 Points'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainButton(
              text: 'Start',
              navigatorTo: QuizPlayScreen(
                totalQuestions: 5,
                totalPoints: 150,
                requiredPoints: 100,
                nextLevel: nextLevel,
                levelIndex: levelIndex,
              ),
            ),
          )
        ],
      ),
    );
  }

  _rowItemLevel(
      {BuildContext context, int index, bool isComplete, bool unlocked}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.secondary, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: unlocked
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPlayScreen(
                              totalQuestions: 10,
                            )));
              }
            : null,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: unlocked
                        ? isComplete
                            ? Color(0xffF5F5F5)
                            : Color(0xffDFDFDF)
                        : Color(0xffB1B1B1)),
                child: unlocked
                    ? Image.asset(
                        IconsLinks().unlock,
                        height: 24,
                        width: 24,
                        color: isComplete
                            ? Colors.black.withOpacity(0.5)
                            : Colors.black,
                      )
                    : Image.asset(
                        IconsLinks().lock,
                        height: 24,
                        width: 24,
                      ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${S.current.level} ${index + 1}: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                " 10 ${S.current.questions}",
                style: TextStyle(fontSize: 10),
              ),
              Spacer(),
              unlocked
                  ? isComplete
                      ? _progressCorrect(context, 0.8)
                      : _progressCorrect(context, 0)
                  : Container(),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.chevron_right_sharp)
            ],
          ),
        ),
      ),
    );
  }

  _progressCorrect(BuildContext context, double percent) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
              color: Color(0xffDEDEDE),
              borderRadius: BorderRadius.circular(1.5)),
        ),
        Container(
          height: 3,
          width: 60 * percent,
          decoration: BoxDecoration(
              color: Color(0xff36FF6E),
              borderRadius: BorderRadius.circular(1.5)),
        )
      ],
    );
  }
}
