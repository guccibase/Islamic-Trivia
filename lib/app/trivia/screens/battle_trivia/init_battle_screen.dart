import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/trivia/screens/widget/countdown_progress.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';

class InitBattleScreen extends StatefulWidget {
  final BuildContext context;

  const InitBattleScreen({Key key, this.context}) : super(key: key);
  @override
  _InitBattleScreenState createState() => _InitBattleScreenState();
}

class _InitBattleScreenState extends State<InitBattleScreen> {
  GlobalKey<CountdownProgressState> countDownKey =
      GlobalKey<CountdownProgressState>();
  int time = 0;
  bool isFound = false;
  Widget findBattleButton;
  // List<BattleHistory> listBattleHistory = [
  //   BattleHistory(
  //       competitorPhotoUrl: ImageLinks().avatar1,
  //       timestamp: "10:10 AM",
  //       yourScore: 9,
  //       competitorScore: 7),
  //   BattleHistory(
  //       competitorPhotoUrl: ImageLinks().avatar2,
  //       timestamp: "9:50 AM",
  //       yourScore: 8,
  //       competitorScore: 6),
  //   BattleHistory(
  //       competitorPhotoUrl: ImageLinks().avatar3,
  //       timestamp: "9:40 AM",
  //       yourScore: 7,
  //       competitorScore: 7),
  //   BattleHistory(
  //       competitorPhotoUrl: ImageLinks().reviewer1,
  //       timestamp: "9:30 AM",
  //       yourScore: 8,
  //       competitorScore: 7),
  //   BattleHistory(
  //       competitorPhotoUrl: ImageLinks().reviewer2,
  //       timestamp: "9:10 AM",
  //       yourScore: 8,
  //       competitorScore: 9),
  //   BattleHistory(
  //       competitorPhotoUrl: ImageLinks().reviewer3,
  //       timestamp: "9:10 AM",
  //       yourScore: 10,
  //       competitorScore: 7),
  // ];
  // Timer _timer;

  @override
  void initState() {
    findBattleButton = _buttonFind(widget.context);
    super.initState();
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text("Battle"),
          ),
          body: _bodyMain(context),
        ),
        // isFound
        //     ? FoundDialog(
        //         onDeny: () {
        //           setState(() {
        //             findBattleButton = _buttonFind(context);
        //             isFound = false;
        //           });
        //         },
        //       )
        //     : Container()
      ],
    );
  }

  _bodyMain(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(42),
                border: Border.all(width: 2, color: Colors.white),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(ImageLinks().goldCup).image)),
          ),
          Text(
            "You",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w600),
          ),
          // RichText(
          //     text: TextSpan(children: [
          //   TextSpan(
          //       text: "2043 ",
          //       style: TextStyle(
          //           color: Color(0xffFC7F0C),
          //           fontSize: 18,
          //           fontWeight: FontWeight.w600)),
          //   TextSpan(
          //       text: S.current.points,
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption
          //           .copyWith(fontWeight: FontWeight.w600)),
          // ])),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.center,
              );
            },
            child: findBattleButton,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Battle History',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'These features are coming soon inshaAllah',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ),

          // Expanded(
          //   child: ListView.builder(
          //       padding: EdgeInsets.zero,
          //       itemCount: listBattleHistory.length,
          //       shrinkWrap: true,
          //       itemBuilder: (context, index) => _itemHistory(context, index)),
          // )
        ],
      ),
    );
  }

  //
  // _itemHistory(BuildContext context, int index) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Row(
  //             children: [
  //               _avatar(context, index),
  //               SizedBox(
  //                 width: 10,
  //               ),
  //               _result(listBattleHistory[index].yourScore,
  //                   listBattleHistory[index].competitorScore),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: Row(
  //             children: [
  //               RichText(
  //                   text: TextSpan(
  //                       style: TextStyle(
  //                           fontSize: 18, fontWeight: FontWeight.w600),
  //                       children: [
  //                     TextSpan(
  //                         text: "${listBattleHistory[index].yourScore}",
  //                         style: TextStyle(color: Color(0xff10A755))),
  //                     TextSpan(
  //                         text:
  //                             " - ${listBattleHistory[index].competitorScore}",
  //                         style: TextStyle(
  //                             color:
  //                                 Theme.of(context).textTheme.headline6.color)),
  //                   ])),
  //               Spacer(),
  //               Text(
  //                 listBattleHistory[index].timestamp,
  //                 style: Theme.of(context).textTheme.overline,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // _result(int yourScore, int competitorScore) {
  //   if (yourScore == competitorScore) {
  //     return Text(
  //       "DRAWN",
  //       style: TextStyle(
  //           color: Color(0xff8D8BF6),
  //           fontSize: 18,
  //           fontWeight: FontWeight.w600),
  //     );
  //   } else if (yourScore > competitorScore) {
  //     return Text(
  //       "WON",
  //       style: TextStyle(
  //           color: Color(0xffFF9C41),
  //           fontSize: 18,
  //           fontWeight: FontWeight.w600),
  //     );
  //   } else {
  //     return Text(
  //       "LOST",
  //       style: TextStyle(
  //           color: Color(0xff8E8E8E),
  //           fontSize: 18,
  //           fontWeight: FontWeight.w600),
  //     );
  //   }
  // }
  //
  // _avatar(BuildContext context, int index) {
  //   return Container(
  //     width: 70,
  //     height: 40,
  //     child: Stack(
  //       children: [
  //         Positioned(
  //           right: 0,
  //           child: Container(
  //             width: 40,
  //             height: 40,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 border: Border.all(
  //                     width: 2, color: Theme.of(context).backgroundColor),
  //                 image: DecorationImage(
  //                     fit: BoxFit.cover,
  //                     image: Image.asset(
  //                             listBattleHistory[index].competitorPhotoUrl)
  //                         .image)),
  //           ),
  //         ),
  //         Positioned(
  //           left: 0,
  //           child: Container(
  //             width: 40,
  //             height: 40,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 border: Border.all(
  //                     width: 2, color: Theme.of(context).backgroundColor),
  //                 image: DecorationImage(
  //                     fit: BoxFit.cover,
  //                     image: Image.asset(ImageLinks().avatar).image)),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  Widget _buttonFind(BuildContext context) {
    return Container(
      key: ValueKey(0),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.blue,
          border: Border.all(color: Color(0xffAAA9A9)),
          gradient: LinearGradient(colors: [
            Color(0xff3277FC),
            Color(0xff3277FC).withOpacity(0),
          ])),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        // onPressed: () {
        //   setState(() {
        //     time = 0;
        //     findBattleButton = _buttonTimer(context);
        //   });
        //   _timerRunning(context);
        // },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find battle",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(" (Coming soon...)")
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buttonTimer(BuildContext context) {
  //   return Container(
  //     key: ValueKey(1),
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
  //     child: Row(
  //       children: [
  //         Expanded(
  //             flex: 1,
  //             child: FlatButton(
  //               padding: EdgeInsets.all(10),
  //               shape: CircleBorder(),
  //               onPressed: () {
  //                 _timer.cancel();
  //                 setState(() {
  //                   // findBattleButton = _buttonFind(context);
  //                 });
  //               },
  //               color: Color(0xffFB521D).withOpacity(0.3),
  //               child: Icon(
  //                 Icons.close,
  //                 size: 24,
  //               ),
  //             )),
  //         Expanded(
  //           flex: 3,
  //           child: Container(
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(23),
  //                 color: Colors.blue,
  //                 border: Border.all(color: Color(0xffAAA9A9)),
  //                 gradient: LinearGradient(colors: [
  //                   Color(0xff3277FC),
  //                   Color(0xff3277FC).withOpacity(0),
  //                 ])),
  //             child: FlatButton(
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(23),
  //               ),
  //               padding: EdgeInsets.symmetric(vertical: 15),
  //               onPressed: () {},
  //               child: Text(
  //                 _timerToString(time),
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .headline6
  //                     .copyWith(fontWeight: FontWeight.w600),
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // _timerRunning(BuildContext context) {
  //   _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       time++;
  //       findBattleButton = _buttonTimer(context);
  //
  //       _vibration(time);
  //       print(time);
  //     });
  //   });
  // }
  //
  // _timerToString(int t) {
  //   DateTime time = DateTime.fromMillisecondsSinceEpoch(t * 1000);
  //   return "${time.minute.toString().padLeft(2, "0")}m : ${time.second.toString().padLeft(2, "0")}s";
  // }
  //
  // _vibration(int time) async {
  //   if (time == 5) {
  //     if (await Vibration.hasVibrator()) {
  //       Vibration.vibrate();
  //     }
  //     setState(() {
  //       _timer.cancel();
  //       isFound = true;
  //     });
  //   }
  // }
}

class BattleHistory {
  final String competitorPhotoUrl;
  final String timestamp;
  final int yourScore;
  final int competitorScore;

  BattleHistory(
      {this.competitorPhotoUrl,
      this.timestamp,
      this.yourScore,
      this.competitorScore});
}
