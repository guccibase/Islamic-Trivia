import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/trivia/model/response_trivia_question.dart';
import 'package:provider/provider.dart';

import 'page_view_holder.dart';

class QuizPage extends StatefulWidget {
  final int index;
  final TriviaQuestion listQuiz;
  final Function(bool) onSelected;
  final Function guidelines;
  const QuizPage(
      {Key key, this.listQuiz, this.onSelected, this.index, this.guidelines})
      : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  List<bool> isClicks = [false, false, false, false];
  bool isAnswer = false;
  bool isTrue = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      audioPlayer.startHeadlessService();
    }
  }

  @override
  Widget build(BuildContext context) {
    double value = Provider.of<PageViewHolder>(context).value;
    double diff = widget.index - value;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 3, 1 / 0.9)
        ..setEntry(1, 1, 1)
        ..setEntry(3, 0, 0.004 * -diff),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: Offset(2, 2),
                  blurRadius: 4)
            ]),
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    child: Text(
                      widget.listQuiz.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                ...List.generate(4, (index) => _answer(index))
              ],
            ),
            Positioned(
                bottom: -6,
                right: 0,
                child: FlatButton(
                  color: Color(0xffFFB31F),
                  onPressed: () {
                    widget.guidelines();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7),
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(17))),
                  child: Icon(Icons.info_outline_rounded),
                )),
          ],
        ),
      ),
    );
  }

  _answer(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5))),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        onPressed: isAnswer
            ? () {}
            : () {
                if (index == widget.listQuiz.rightAnswer.answer) {
                  audioCache.play("sounds/true.mp3");
                  widget.onSelected(true);
                  isAnswer = true;
                } else {
                  audioCache.play("sounds/false.mp3");
                  widget.onSelected(false);
                  isAnswer = false;
                }

                setState(() {
                  isClicks[index] = true;
                });
              },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: widget.listQuiz.answers[index].length < 50
                  ? 70.0
                  : widget.listQuiz.answers[index].length > 49 &&
                          widget.listQuiz.answers[index].length < 60
                      ? 70
                      : widget.listQuiz.answers[index].length > 59 &&
                              widget.listQuiz.answers[index].length < 80
                          ? 70
                          : 120.0,
              width: isClicks[index]
                  ? MediaQuery.of(context).size.width
                  // : index == widget.listQuiz.rightAnswer.answer && isAnswer
                  //     ? MediaQuery.of(context).size.width
                  : 0,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: index == widget.listQuiz.rightAnswer.answer
                    ? LinearGradient(colors: [
                        Color(0xff215FFF).withOpacity(0.8),
                        Color(0xff14F3A3).withOpacity(0.8),
                      ])
                    : LinearGradient(colors: [
                        Color(0xffFB521D).withOpacity(0.8),
                        Color(0xffFAFF07).withOpacity(0.8),
                      ]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '',
                style: TextStyle(color: Colors.transparent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Center(
                      child: Text(
                        widget.listQuiz.answers[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isAnswer
                                ? index == widget.listQuiz.rightAnswer.answer
                                    ? Colors.white
                                    : Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .color
                                : Theme.of(context).textTheme.headline6.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: isClicks[index]
                            ? index == widget.listQuiz.rightAnswer.answer
                                ? Color(0xff215FFF)
                                : Color(0xffFB521D)
                            : index == widget.listQuiz.rightAnswer.answer &&
                                    isAnswer
                                ? Color(0xff215FFF)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isClicks[index]
                              ? index == widget.listQuiz.rightAnswer.answer
                                  ? Color(0xff215FFF)
                                  : Color(0xffFB521D)
                              : index == widget.listQuiz.rightAnswer.answer &&
                                      isAnswer
                                  ? Color(0xff215FFF)
                                  : Color(0xffBAB8B8).withOpacity(0.5),
                        )),
                    child: isAnswer
                        ? index == widget.listQuiz.rightAnswer.answer
                            ? Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.clear,
                                size: 12,
                                color: Colors.white,
                              )
                        : Icon(
                            Icons.clear,
                            size: 12,
                            color: Colors.white,
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
