import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/trivia/categories.dart';
import 'package:islamic_trivia/app/trivia/screens/quiz_play/quiz_play_screen.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';
import 'package:islamic_trivia/generated/l10n.dart';

class DailyQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(S.current.daily_quiz),
      ),
      body: _bodyMain(context),
    );
  }

  catList(BuildContext context) {
    List<Widget> cats = [];

    for (String i in categories) {
      cats.add(
        _itemDailyQuiz(
            context: context,
            title: i,
            subTile: '1 Question',
            imageLink: ImageLinks().basmalah,
            question: 10),
      );
    }
    return cats;
  }

  _bodyMain(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: catList(context)
        // [
        //   _itemDailyQuiz(
        //       context: context,
        //       title: categories[0],
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().sport,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Quran',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().nature,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Seerah',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().music,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Lives of the prophets',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().science,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Mothers of the believers',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().sport,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Hadeeth',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().nature,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Khulafa\' Rashideen',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().music,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: ' \'Ashara',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().science,
        //       question: 10),
        //   _itemDailyQuiz(
        //       context: context,
        //       title: 'Mujtahideen',
        //       subTile: '1 Question',
        //       imageLink: ImageLinks().science,
        //       question: 10),
        // ],
        );
  }

  _itemDailyQuiz(
      {BuildContext context,
      String title,
      String imageLink,
      String subTile,
      int question}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuizPlayScreen(
                        totalQuestions: 10,
                      )));
        },
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(imageLink).image),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              offset: Offset(2, 2),
                              blurRadius: 4)
                        ]),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        subTile,
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Spacer(),
                      Text(
                        "$question points",
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
