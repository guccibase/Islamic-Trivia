import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:islamic_trivia/app/quiz/screens/battle_quiz/init_battle_screen.dart';
import 'package:islamic_trivia/app/quiz/screens/category_quiz_screen/category_quiz_screen.dart';
import 'package:islamic_trivia/app/quiz/screens/daily_quiz/daily_quiz_screen.dart';
import 'package:islamic_trivia/app/quiz/screens/emty_screen/empty_screen.dart';
import 'package:islamic_trivia/app/quiz/screens/leaderboard/leaderboard_screen.dart';
import 'package:islamic_trivia/data_source/assets_link/src/icon_links.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class QuizHomeScreen extends StatefulWidget {
  @override
  _QuizHomeScreenState createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  bool isShowDrawer = false;

  List<bool> isSelectedTheme;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
  }

  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
        _buttonMain(
            context: context,
            text: S.current.play_quiz,
            navigatorTo: CategoryQuizScreen()),
        SizedBox(
          height: 10,
        ),
        _buttonMain(
            context: context,
            text: S.current.battle_quiz,
            navigatorTo: InitBattleScreen(
              context: context,
            )),
        SizedBox(
          height: 10,
        ),
        _buttonMain(
            context: context,
            text: S.current.daily_quiz,
            navigatorTo: DailyQuizScreen()),
        SizedBox(
          height: 20,
        ),
        _buttonMain(
            context: context,
            text: S.current.leader_board,
            navigatorTo: DailyQuizScreen()),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _leftDrawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff3277FC),
                Theme.of(context).backgroundColor
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: Image.asset(
                        ImageLinks().avatar,
                        fit: BoxFit.cover,
                      ).image),
                      border: Border.all(
                          color: Theme.of(context).backgroundColor, width: 2)),
                ),
                Text(
                  "James Gouse",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "jamesgouse@gmail.com",
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ),
        ),
        _itemOptionDrawer(
            context: context,
            icon: Icons.leaderboard,
            text: S.current.leader_board,
            onTap: () {
              _innerDrawerKey.currentState
                  .toggle(direction: InnerDrawerDirection.end);
              pushNewScreen(context,
                  screen: LeaderBoardScreen(), withNavBar: false);
            }),
        _itemOptionDrawer(
            context: context,
            iconLink: IconsLinks().statistics,
            text: S.current.statistics),
        _divider(context),
        _itemOptionDrawer(
            context: context,
            icon: Icons.person_add_alt,
            text: S.current.invite_friends),
        _itemOptionDrawer(
            context: context,
            iconLink: IconsLinks().share,
            text: S.current.share),
        _itemOptionDrawer(
            context: context, icon: Icons.settings, text: S.current.setting),
        _divider(context),
        _itemOptionDrawer(
            context: context, icon: Icons.info, text: S.current.aboutUs),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FlatButton(
              onPressed: () {},
              child: Text(
                S.current.logout,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }

  _buttonMain({BuildContext context, String text, Widget navigatorTo}) {
    return Container(
      height: MediaQuery.of(context).size.height / 10.4,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: Offset(2, 2),
                blurRadius: 4)
          ]),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigatorTo));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Align(
                  child: AutoSizeText(
                    text,
                    maxLines: 1,
                    minFontSize: 12,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0031B0)),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _itemOptionDrawer(
      {BuildContext context,
      IconData icon,
      String iconLink,
      String text,
      Function onTap}) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: InkWell(
          onTap: onTap != null
              ? onTap
              : () {
                  _innerDrawerKey.currentState
                      .toggle(direction: InnerDrawerDirection.end);
                  pushNewScreen(context,
                      screen: EmptyScreen(
                        title: text,
                      ),
                      withNavBar: false);
                },
          child: Row(
            children: [
              icon != null
                  ? Icon(icon)
                  : Image.asset(
                      iconLink,
                      width: 24,
                      height: 24,
                      color: Theme.of(context).iconTheme.color,
                    ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }

  _divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Divider(
        thickness: 0.5,
      ),
    );
  }
}
