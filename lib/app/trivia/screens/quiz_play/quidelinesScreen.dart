import 'package:flutter/material.dart';
import 'package:islamic_trivia/data_source/trivia_data/guidelines.dart';

class Guidelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Guidelines"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(generalGuideline),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(generalGuidelines),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(generalGuidelines0),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(generalGuidelines1),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(generalGuidelines2),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(generalGuidelines3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
