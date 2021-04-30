import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/trivia/screens/levels_screen/start_screen.dart';
import 'package:islamic_trivia/data_source/memory_service/memory_service.dart';

class Level extends StatefulWidget {
  final int index;
  final String imageLink;
  final String name;
  final String nextLevel;
  const Level({Key key, this.imageLink, this.nextLevel, this.name, this.index})
      : super(key: key);
  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _translateAnimation;
  Animation<double> _fadeAnimation;
  bool locked = true;
  String level;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.index * 100 + 600));
    _translateAnimation = Tween<Offset>(begin: Offset(0, 100), end: Offset.zero)
        .animate(_animationController);
    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
    checkLockedStatus();
    super.initState();
  }

  checkLockedStatus() async {
    level =
        await UserDataSharedPref.sharedPrf.getUserUnlockedLevels(widget.name);
    if (level != null || widget.name == "Level 1") locked = false;
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: _translateAnimation.value,
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: child,
                );
              },
              child: child),
        );
      },
      child: Container(
        margin: widget.index % 3 != 1
            ? EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5)
            : EdgeInsets.only(left: 5, right: 5, top: 40, bottom: 5),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => locked
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartScreen(
                          title: widget.name,
                          nextLevel: widget.nextLevel,
                          levelIndex: widget.index,
                        ),
                      ),
                    ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        locked ? Icons.lock : Icons.lock_open,
                        color: Colors.white,
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).backgroundColor,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff3277FC),
                            Theme.of(context).backgroundColor
                          ]),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          colorFilter: locked
                              ? ColorFilter.mode(Colors.black, BlendMode.color)
                              : null,
                          image: Image.asset(
                            widget.imageLink,
                          ).image),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).shadowColor,
                            offset: Offset(2, 2),
                            blurRadius: 4)
                      ]),
                ),
              ),
            ),
            Text(
              widget.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
