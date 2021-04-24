import 'package:flutter/material.dart';
import 'package:islamic_trivia/generated/l10n.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  const EmptyScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(title),
      ),
      body: Center(
        child: Text("$title ${S.current.updating_screen}"),
      ),
    );
  }
}
