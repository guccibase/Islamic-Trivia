import 'dart:async';

import 'package:flutter/material.dart';

class CountdownProgress extends StatefulWidget {
  final int seconds;
  final  Function onOverTime;
  const CountdownProgress({Key key, this.seconds, this.onOverTime}) : super(key: key);
  @override
  CountdownProgressState createState() => CountdownProgressState();
}

class CountdownProgressState extends State<CountdownProgress> {

  int time;
  Timer _timer;
  @override
  void initState() {
  time = widget.seconds;
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
    return Row(
      children: [
        Icon(Icons.access_time),
        SizedBox(width: 8,),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2,
                height: 24,
              alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 2,color: Color(0xffEFEFEF))
                ),
              child: Text("", style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),)
            ),
            Positioned(
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  height: 22,
                  width: 24+ (MediaQuery.of(context).size.width/2-28)*time/widget.seconds,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff6E59F2),
                            Color(0xff2CD9FF),
                          ],
                      )
                  ),
                  child: Text("", style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            Text(_timeToString(time), style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),)
          ],
        ),
      ],
    );
  }

  _timeToString(int t){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(t*1000);
    if(t >59){
      return "${time.minute.toString().padLeft(2,"0")}m : ${time.second.toString().padLeft(2,"0")}s";
    }else{
      return " ${time.second.toString().padLeft(2,"0")}s";
    }
  }

  void countdown() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (time == 0) {
          setState(() {
            widget.onOverTime();
            time = widget.seconds;
          });

        } else {
          setState(() {
            time--;
          });
        }
      },
    );
  }

  void reSetTime(){
    setState(() {
      time = widget.seconds;
    });
  }

  void cancelTime(){
    setState(() {
      _timer.cancel();
    });
  }
}
