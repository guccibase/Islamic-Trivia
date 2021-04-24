import 'package:flutter/material.dart';
import 'package:islamic_trivia/data_source/assets_link/assets_links.dart';
import 'package:islamic_trivia/generated/l10n.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultQuizPlay extends StatefulWidget {
  final int correct;
  final int length;
  final int competitorCorrect;
  ResultQuizPlay({Key key, this.correct, this.length, this.competitorCorrect})
      : super(key: key);

  @override
  _ResultQuizPlayState createState() => _ResultQuizPlayState();
}

class _ResultQuizPlayState extends State<ResultQuizPlay>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _animationController;
  Animation<double> _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 2, end: 1).animate(CurvedAnimation(
        curve: Curves.elasticOut, parent: _animationController));
    _animationController.forward();
    super.initState();
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
          S.current.quiz_result,
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
                child: Image.asset(
                  ImageLinks().congrats,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 50,
                  left: 60,
                  right: 60,
                  bottom: 180,
                  child: widget.length != null
                      ? _playQuizResult(context)
                      : _battleQuizResult(context)),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
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
                          size: 34,
                        )),
                    Spacer(),
                    FlatButton(
                        onPressed: () {
                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(content: Text("Share")));
                        },
                        padding: EdgeInsets.all(10),
                        color: Color(0xff8F8F8F).withOpacity(0.5),
                        shape: CircleBorder(),
                        child: Image.asset(
                          IconsLinks().share,
                          height: 34,
                          width: 34,
                          color: Theme.of(context).iconTheme.color,
                        )),
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
              S.current.your_score.toUpperCase(),
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
            percent: widget.correct / widget.length,
            center: new Text(
              "${widget.correct}/${widget.length}",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Color(0xffD6D6D6),
            progressColor: Color(0xff3277FC),
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
