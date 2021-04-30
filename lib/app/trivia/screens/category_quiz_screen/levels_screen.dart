import 'package:flutter/material.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';

import 'levels.dart';

class LevelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Levels"),
      ),
      body: _bodyMain(context),
    );
  }

  _bodyMain(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 0.66,
      children: [
        Level(
          index: 0,
          name: "Level 1",
          nextLevel: "Level 2",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 1,
          name: "Level 2",
          nextLevel: "Level 3",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 2,
          name: "Level 3",
          nextLevel: "Level 4",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 3,
          name: "Level 4",
          nextLevel: "Level 5",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 4,
          name: "Level 5",
          nextLevel: "Level 6",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 5,
          name: "Level 6",
          nextLevel: "Level 7",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 6,
          name: "Level 7",
          nextLevel: "Level 8",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 7,
          name: "Level 8",
          nextLevel: "Level 9",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 8,
          name: "Level 9",
          nextLevel: "Level 10",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 9,
          name: "Level 10",
          nextLevel: "Level 11",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 10,
          name: "Level 11",
          nextLevel: "Level 12",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 11,
          name: "Level 12",
          nextLevel: "Level 13",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 12,
          name: "Level 13",
          nextLevel: "Level 14",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 13,
          name: "Level 14",
          nextLevel: "Level 15",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 14,
          name: "Level 15",
          nextLevel: "Level 16",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 15,
          name: "Level 16",
          nextLevel: "Level 17",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 16,
          name: "Level 17",
          nextLevel: "Level 18",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 17,
          name: "Level 18",
          nextLevel: "Level 19",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 18,
          name: "Level 19",
          nextLevel: "Level 20",
          imageLink: ImageLinks().basmalah,
        ),
        Level(
          index: 19,
          name: "Level 20",
          nextLevel: "Level 21",
          imageLink: ImageLinks().basmalah,
        ),
      ],
    );
  }
}
