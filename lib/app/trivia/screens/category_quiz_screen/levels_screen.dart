import 'package:flutter/material.dart';
import 'package:islamic_trivia/data_source/assets_link/src/image_links.dart';

import 'item_category.dart';

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
        title: Text("Category Quiz"),
      ),
      body: _bodyMain(context),
    );
  }

  _bodyMain(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 0.66,
      children: [
        ItemCategory(
          index: 0,
          name: "Level 1",
          imageLink: ImageLinks().basmalah,
          locked: false,
        ),
        ItemCategory(
          index: 1,
          name: "Level 2",
          imageLink: ImageLinks().basmalah,
          locked: false,
        ),
        ItemCategory(
          index: 2,
          name: "Level 3",
          imageLink: ImageLinks().basmalah,
          locked: false,
        ),
        ItemCategory(
          index: 3,
          name: "Level 4",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 4,
          name: "Level 5",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 5,
          name: "Level 6",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 6,
          name: "Level 7",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 7,
          name: "Level 8",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 8,
          name: "Level 9",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 10,
          name: "Level 10",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 11,
          name: "Level 11",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 12,
          name: "Level 12",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 13,
          name: "Level 13",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 14,
          name: "Level 14",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 15,
          name: "Level 15",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 16,
          name: "Level 16",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 17,
          name: "Level 17",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 18,
          name: "Level 18",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 19,
          name: "Level 19",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
        ItemCategory(
          index: 20,
          name: "Level 20",
          imageLink: ImageLinks().basmalah,
          locked: true,
        ),
      ],
    );
  }
}
