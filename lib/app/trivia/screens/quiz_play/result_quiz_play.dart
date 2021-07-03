import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/app.dart';
import 'package:islamic_trivia/app/trivia/provider/battle_trivia_screen.dart';
import 'package:islamic_trivia/app/trivia/screens/levels_screen/levels_screen.dart';
import 'package:islamic_trivia/data_source/assets_link/assets_links.dart';
import 'package:islamic_trivia/data_source/memory_service/memory_service.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ResultQuizPlay extends StatefulWidget {
  final int numberOfQuestions;
  final int totalPoints;
  final int requiredPoints;
  final int acquiredPoints;
  final int competitorPoints;
  final int levelIndex;
  final String nextLevel;

  ResultQuizPlay(
      {Key key,
      this.numberOfQuestions,
      this.totalPoints,
      this.requiredPoints,
      this.competitorPoints,
      this.acquiredPoints,
      this.nextLevel,
      this.levelIndex})
      : super(key: key);

  @override
  _ResultQuizPlayState createState() => _ResultQuizPlayState();
}

class _ResultQuizPlayState extends State<ResultQuizPlay>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _animationController;
  Animation<double> _animation;
  bool repeatedLevel = false;
  bool morePointsThisTime = false;
  int totalUserPoints;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 2, end: 1).animate(CurvedAnimation(
        curve: Curves.elasticOut, parent: _animationController));
    _animationController.forward();
    saveLevelPoints();
    super.initState();
  }

  saveLevelPoints() async {
    List<String> points = await UserDataSharedPref.sharedPrf.getLevelPoints();

    if (points != null && points.length > widget.levelIndex) {
      // level was played before
      repeatedLevel = true;
      unlockNextLevel();
      int prevPoints = int.parse(points[widget.levelIndex]);
      if (prevPoints < widget.acquiredPoints) {
        // acquired more points than last time user played same level
        morePointsThisTime = true;

        int pointDiff = widget.acquiredPoints - prevPoints;
        updateUserTotalPoints(pointDiff);
        points[widget.levelIndex] = widget.acquiredPoints.toString();
        await UserDataSharedPref.sharedPrf.setUserCompletedLevelPoints(points);
      }
    } else if (widget.acquiredPoints >= widget.requiredPoints) {
      if (points == null) points = [];
      points.add(widget.acquiredPoints.toString());
      await UserDataSharedPref.sharedPrf.setUserCompletedLevelPoints(points);
      await updateUserTotalPoints(widget.acquiredPoints);
      await unlockNextLevel();
    }
    setState(() {});
  }

  unlockNextLevel() async {
    if (widget.nextLevel != "The end") {
      await UserDataSharedPref.sharedPrf.setUnlockedLevels(widget.nextLevel);
    }
  }

  updateUserTotalPoints(currentLevelPoints) async {
    totalUserPoints =
        Provider.of<UserData>(context, listen: false).getUserPoints;

    if (totalUserPoints == null) {
      totalUserPoints = currentLevelPoints;
    } else {
      totalUserPoints += currentLevelPoints;
    }
    Provider.of<UserData>(context, listen: false).setUserPoints =
        totalUserPoints;
    return await UserDataSharedPref.sharedPrf.setUserPoints(totalUserPoints);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: _bodyMain(context),
    );
  }

  _bodyMain(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppBar().preferredSize.height,
        ),
        Text(
          'Result',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: widget.acquiredPoints < widget.requiredPoints
                    ? null
                    : Image.asset(
                        ImageLinks().congrats,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                  top: 50,
                  left: 60,
                  right: 60,
                  bottom: 180,
                  child: widget.numberOfQuestions != null
                      ? _playQuizResult(context)
                      : _battleQuizResult(context)),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(10),
                        color: Color(0xff8F8F8F).withOpacity(0.5),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.clear,
                        )),
                    widget.acquiredPoints < widget.requiredPoints
                        ? SizedBox.shrink()
                        : FlatButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TriviaHomeScreen(),
                                  ),
                                ),
                            padding: EdgeInsets.all(10),
                            color: Color(0xff8F8F8F).withOpacity(0.5),
                            shape: CircleBorder(),
                            child: Icon(Icons.home_outlined)),
                    widget.acquiredPoints < widget.requiredPoints
                        ? FlatButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TriviaHomeScreen(),
                                  ),
                                ),
                            padding: EdgeInsets.all(10),
                            color: Color(0xff8F8F8F).withOpacity(0.5),
                            shape: CircleBorder(),
                            child: Icon(Icons.home_outlined))
                        : FlatButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LevelsScreen(),
                                  ),
                                ),
                            padding: EdgeInsets.all(10),
                            color: Color(0xff8F8F8F).withOpacity(0.5),
                            shape: CircleBorder(),
                            child: Icon(Icons.navigate_next)),
                  ],
                ),
              )
            ],
          ),
        )),
        SizedBox(
          height: AppBar().preferredSize.height,
        ),
      ],
    );
  }

  Widget _playQuizResult(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).backgroundColor.withOpacity(0.65)
              ])),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'MINIMUM REQUIRED POINTS',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "${widget.requiredPoints}",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'YOUR POINTS',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          CircularPercentIndicator(
            radius: 170.0,
            animation: true,
            animationDuration: 1000,
            lineWidth: 35.0,
            percent: widget.acquiredPoints > 0
                ? widget.acquiredPoints / widget.totalPoints
                : 0.0,
            center: new Text(
              "${widget.acquiredPoints}/${widget.totalPoints}",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Color(0xffD6D6D6),
            progressColor: Color(0xff3277FC),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.acquiredPoints < widget.requiredPoints
                  ? Column(
                      children: [
                        Text(
                          repeatedLevel ? '' : '${failMsgs[randomNum]}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              color: Colors.red),
                        ),
                        Text(
                          "Try again!",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20.0),
                        ),
                        Text(
                          '${failEncouragementMsgs[randomNum]}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          '${passMsgs[randomNum]}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.green),
                        ),
                        repeatedLevel && morePointsThisTime
                            ? Text(
                                "You've done better this time",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            : repeatedLevel && !morePointsThisTime
                                ? Text(
                                    "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontWeight: FontWeight.w600),
                                  )
                                : Text(
                                    "You've unlocked the next level",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                        Text(
                          '${encouragementMsgs[randomNum]}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }

  List failMsgs = [
    "You did not reach the target points unlock the next level",
    "You failed to reach the required points to unlock the next level",
    "Not enough points to unlock the next level",
    "You didn't collect enough points to unlock the next level",
    "Uh uhh! Your points are not enought to unlock the next level",
    "Level failed"
  ];

  List failEncouragementMsgs = [
    "InshaAllah you will do great next time",
    "Don't give up, you can do it",
    "Go hard next time, you've got this",
    "Bring your 'A' game next time. You can do it",
    "Winners are not people who never fail, but people who never quit",
    "You will get it next time inshaAllah"
  ];

  int randomNum = Random().nextInt(5);

  List passMsgs = [
    "Well done!",
    "Good job!",
    "MashaAllah!",
    "SubhanAllah!",
    "Wow!!!",
    "Nice!"
  ];

  List encouragementMsgs = [
    "Don't stop",
    "Keep going",
    "You should be proud",
    "Go hard, and play smart",
    "Keep doing what you’re doing",
    "Keep up the good work"
  ];

  Widget _battleQuizResult(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).backgroundColor.withOpacity(0.65)
              ])),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "YOU WON",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Image.asset(
            ImageLinks().goldCup,
            width: 130,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: Image.asset(
                    ImageLinks().avatar,
                    fit: BoxFit.cover,
                  ).image,
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline4.color),
                        children: [
                      TextSpan(
                          text: "9",
                          style: TextStyle(color: Color(0xff10A755))),
                      TextSpan(
                        text: ": 7",
                      )
                    ])),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: Image.asset(
                    ImageLinks().reviewer2,
                    fit: BoxFit.cover,
                  ).image,
                )
              ],
            ),
          ),
          Text(
            S.current.congratulations,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
