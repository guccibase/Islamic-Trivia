import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'battle_quiz_screen.dart';

class FoundDialog extends StatefulWidget {
  final Function onDeny;
  const FoundDialog({Key key, this.onDeny}) : super(key: key);
  @override
  _FoundDialogState createState() => _FoundDialogState();
}

class _FoundDialogState extends State<FoundDialog>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _animation;

  int time = 12;
  int accepted = 0;
  bool isAccept = false;

  Timer _timer;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 2, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut));
    _animationController.forward();
    countdown();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff000000).withOpacity(0.5),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
              alignment: Alignment.center,
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.height / 2.5 - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).backgroundColor),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(S.current.found_player),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 88,
                      animationDuration: 1000,
                      animation: true,
                      addAutomaticKeepAlive: true,
                      animateFromLastPercent: true,
                      backgroundColor: Colors.transparent,
                      progressColor: Color(0xff46FB29),
                      lineWidth: 4,
                      reverse: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: time > 1 ? (time - 2) / 10 : 0,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: Image.asset(
                        ImageLinks().reviewer2,
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ],
                ),
                Text(
                  "Anna White",
                  style: Theme.of(context).textTheme.headline6,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "1923 ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFC7F0C))),
                  TextSpan(
                      text: S.current.points,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline6.color)),
                ])),
                Spacer(),
                Text("$accepted/2 ${S.current.accept.toLowerCase()} ..."),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      FlatButton(
                          onPressed: () {
                            _timer.cancel();
                            widget.onDeny();
                          },
                          color: Color(0xffFB521D),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)),
                          child: Text(
                            S.current.deny,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Spacer(),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              accepted++;
                              _navigatorToBattle();
                            });
                          },
                          color: Color(0xff1B84FF),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)),
                          child: Text(
                            S.current.accept,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  countdown() {
    _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time == 0) {
          timer.cancel();
          widget.onDeny();
        } else if (time == 9 && !isAccept) {
          accepted++;
          isAccept = true;
          time--;
          _navigatorToBattle();
        } else {
          time--;
        }
      });
    });
  }

  _navigatorToBattle() {
    if (accepted == 2) {
      _timer.cancel();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BattleQuizScreen()));
      widget.onDeny();
    }
  }
}
