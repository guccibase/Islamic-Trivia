import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Widget navigatorTo;
  final String text;
  const MainButton({
    Key key,
    this.navigatorTo,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
