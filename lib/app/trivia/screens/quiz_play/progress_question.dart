import 'package:flutter/material.dart';

class ProgressQuestion extends StatefulWidget {
    final  int questionLength;
    final int count;
  const ProgressQuestion({Key key, this.questionLength, this.count}) : super(key: key);
  @override
  _ProgressQuestionState createState() => _ProgressQuestionState();
}

class _ProgressQuestionState extends State<ProgressQuestion> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width-60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(1.5)
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: 3,
          width: (MediaQuery.of(context).size.width-60)*widget.count/widget.questionLength,
          decoration: BoxDecoration(
              color: Color(0xff00FF57),
              borderRadius: BorderRadius.circular(1.5)
          ),
        )
      ],
    );
  }
}
