import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/app.dart';
import 'package:islamic_trivia/app/trivia/provider/battle_trivia_screen.dart';
import 'package:islamic_trivia/app/trivia/screens/battle_trivia/init_battle_screen.dart';
import 'package:islamic_trivia/app/trivia/screens/category_quiz_screen/levels_screen.dart';
import 'package:islamic_trivia/app/trivia/screens/daily_quiz/daily_quiz_screen.dart';
import 'package:islamic_trivia/app/trivia/screens/quiz_play/quidelinesScreen.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';
import 'package:islamic_trivia/data_source/memory_service/memory_service.dart';
import 'package:islamic_trivia/widget/main_button.dart';
import 'package:provider/provider.dart';

class TriviaHomeScreen extends StatefulWidget {
  @override
  _TriviaHomeScreenState createState() => _TriviaHomeScreenState();
}

class _TriviaHomeScreenState extends State<TriviaHomeScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  bool isShowDrawer = false;
  String _points = '0';

  List<bool> isSelectedTheme;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    getUserPoints();
  }

  getUserPoints() async {
    var points = Provider.of<UserData>(context, listen: false);
    points.setUserPoints = await UserDataSharedPref.sharedPrf.getUserPoints();
    if (points.getUserPoints == null) points.setUserPoints = 0;
    _points = points.getUserPoints.toString();
  }

  // final GlobalKey<InnerDrawerState> _innerDrawerKey =
  //     GlobalKey<InnerDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Row(
                  children: [
                    ImageIcon(AssetImage('assets/icons/trophy.png')),
                    Text(
                      '$_points ${_points == 1 ? 'Point' : 'Points'}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
        backgroundColor: Color(0xff76A5FF),
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26))),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Islamic Trivia",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 2.2 / 4,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3277FC),
                    Theme.of(context).backgroundColor
                  ])),
          child: Image.asset(ImageLinks().quizMain),
        ),
        buttonMain(
            context: context, text: "Levels", navigatorTo: LevelsScreen()),
        SizedBox(
          height: 10,
        ),
        buttonMain(
            context: context,
            text: "Battle",
            navigatorTo: InitBattleScreen(
              context: context,
            )),
        SizedBox(
          height: 10,
        ),
        buttonMain(
            context: context,
            text: "Daily Bonus Points",
            navigatorTo: DailyQuizScreen()),
        SizedBox(
          height: 20,
        ),
        buttonMain(
            context: context,
            text: "Leaderboards",
            navigatorTo: LeaderBoardScreen()),
        SizedBox(
          height: 10,
        ),
        buttonMain(
            context: context,
            text: "General guidelines",
            navigatorTo: Guidelines()),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
  //
  // _leftDrawer(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.zero,
  //     shrinkWrap: true,
  //     physics: ClampingScrollPhysics(),
  //     children: [
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         height: MediaQuery.of(context).size.height / 3,
  //         decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //                 colors: [
  //               Color(0xff3277FC),
  //               Theme.of(context).backgroundColor
  //             ])),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 height: 80,
  //                 width: 80,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(40),
  //                     image: DecorationImage(
  //                         image: Image.asset(
  //                       ImageLinks().avatar,
  //                       fit: BoxFit.cover,
  //                     ).image),
  //                     border: Border.all(
  //                         color: Theme.of(context).backgroundColor, width: 2)),
  //               ),
  //               Text(
  //                 "James Gouse",
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .headline6
  //                     .copyWith(fontWeight: FontWeight.w600),
  //               ),
  //               Text(
  //                 "jamesgouse@gmail.com",
  //                 style: Theme.of(context).textTheme.bodyText2,
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //       _itemOptionDrawer(
  //           context: context,
  //           icon: Icons.leaderboard,
  //           text: S.current.leader_board,
  //           onTap: () {
  //             _innerDrawerKey.currentState
  //                 .toggle(direction: InnerDrawerDirection.end);
  //             pushNewScreen(context,
  //                 screen: LeaderBoardScreen(), withNavBar: false);
  //           }),
  //       _itemOptionDrawer(
  //           context: context,
  //           iconLink: IconsLinks().statistics,
  //           text: S.current.statistics),
  //       _divider(context),
  //       _itemOptionDrawer(
  //           context: context,
  //           icon: Icons.person_add_alt,
  //           text: S.current.invite_friends),
  //       _itemOptionDrawer(
  //           context: context,
  //           iconLink: IconsLinks().share,
  //           text: S.current.share),
  //       _itemOptionDrawer(
  //           context: context, icon: Icons.settings, text: S.current.setting),
  //       _divider(context),
  //       _itemOptionDrawer(
  //           context: context, icon: Icons.info, text: S.current.aboutUs),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 10),
  //         child: FlatButton(
  //             onPressed: () {},
  //             child: Text(
  //               S.current.logout,
  //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //             )),
  //       ),
  //     ],
  //   );
  // }

  buttonMain({BuildContext context, String text, Widget navigatorTo}) {
    return MainButton(text: text, navigatorTo: navigatorTo);
  }

  // _itemOptionDrawer(
  //     {BuildContext context,
  //     IconData icon,
  //     String iconLink,
  //     String text,
  //     Function onTap}) {
  //   return Material(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  //       child: InkWell(
  //         onTap: onTap != null
  //             ? onTap
  //             : () {
  //                 _innerDrawerKey.currentState
  //                     .toggle(direction: InnerDrawerDirection.end);
  //                 pushNewScreen(context,
  //                     screen: EmptyScreen(
  //                       title: text,
  //                     ),
  //                     withNavBar: false);
  //               },
  //         child: Row(
  //           children: [
  //             icon != null
  //                 ? Icon(icon)
  //                 : Image.asset(
  //                     iconLink,
  //                     width: 24,
  //                     height: 24,
  //                     color: Theme.of(context).iconTheme.color,
  //                   ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             Text(
  //               text,
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .headline6
  //                   .copyWith(fontWeight: FontWeight.w600),
  //             ),
  //             Spacer(),
  //             Icon(Icons.chevron_right)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // _divider(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 15),
  //     child: Divider(
  //       thickness: 0.5,
  //     ),
  //   );
  // }
}
