import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatefulWidget {
  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  PageController _pageController = PageController(initialPage: 0);
  List<bool> listHeader = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Leaderboards"),
      ),
      body: _bodyMain(context),
    );
  }

  _bodyMain(BuildContext context) {
    return Column(
      children: [
        _header(context),
        Center(
          child: Text("Coming soon.."),
        )
      ],
    );
  }

  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffE3E3E3), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: listHeader[0] ? Color(0xff1952E4) : Colors.transparent,
              onPressed: () {
                setState(() {
                  listHeader[0] = true;
                  listHeader[1] = false;
                  listHeader[2] = false;
                });
                // _pageController.animateToPage(0,
                //     duration: Duration(milliseconds: 800), curve: Curves.ease);
              },
              child: Text(
                "All time",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: listHeader[0]
                        ? Colors.white
                        : Theme.of(context).textTheme.headline6.color),
              )),
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: listHeader[1] ? Color(0xff1952E4) : Colors.transparent,
              onPressed: () {
                setState(() {
                  listHeader[0] = false;
                  listHeader[1] = true;
                  listHeader[2] = false;
                });
                // _pageController.animateToPage(1,
                //     duration: Duration(milliseconds: 800), curve: Curves.ease);
              },
              child: Text(
                "This week",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: listHeader[1]
                        ? Colors.white
                        : Theme.of(context).textTheme.headline6.color),
              )),
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: listHeader[2] ? Color(0xff1952E4) : Colors.transparent,
              onPressed: () {
                setState(() {
                  listHeader[0] = false;
                  listHeader[1] = false;
                  listHeader[2] = true;
                });
                // _pageController.animateToPage(2,
                //     duration: Duration(milliseconds: 800), curve: Curves.ease);
              },
              child: Text(
                "This month",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: listHeader[2]
                        ? Colors.white
                        : Theme.of(context).textTheme.headline6.color),
              )),
        ],
      ),
    );
  }

  // _leaderboard(BuildContext context) {
  //   return Expanded(
  //     child: PageView(
  //       controller: _pageController,
  //       physics: NeverScrollableScrollPhysics(),
  //       children: [
  //         _page(context),
  //         _page(context),
  //         _page(context),
  //       ],
  //     ),
  //   );
  // }
  //
  // _page(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.zero,
  //     shrinkWrap: true,
  //     physics: ClampingScrollPhysics(),
  //     children: [
  //       _top3(context),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       ...List.generate(
  //           listLeaderBoard.length, (index) => _itemLeaderBoard(context, index))
  //     ],
  //   );
  // }
  //
  // _top3(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           alignment: Alignment.bottomRight,
  //           margin: EdgeInsets.only(top: 100),
  //           child: _topPlayer(
  //               scale: 0.8,
  //               imageLink: ImageLinks().avatar1,
  //               iconLink: IconsLinks().silverTop,
  //               name: "Alex Stanton",
  //               number: 2,
  //               points: 2002),
  //         ),
  //       ),
  //       Container(
  //         width: 90,
  //         child: _topPlayer(
  //             scale: 1,
  //             imageLink: ImageLinks().avatar,
  //             iconLink: IconsLinks().goldenTop,
  //             name: "James Gouse",
  //             number: 1,
  //             points: 2043),
  //       ),
  //       Expanded(
  //         child: Container(
  //           alignment: Alignment.bottomLeft,
  //           margin: EdgeInsets.only(top: 100),
  //           child: _topPlayer(
  //               scale: 0.8,
  //               imageLink: ImageLinks().avatar2,
  //               iconLink: IconsLinks().bronzeTop,
  //               name: "Alan Cooper",
  //               number: 3,
  //               points: 1930),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // _topPlayer(
  //     {String imageLink,
  //     String iconLink,
  //     int number,
  //     String name,
  //     int points,
  //     double scale}) {
  //   return Column(
  //     children: [
  //       Transform.scale(
  //         scale: scale,
  //         child: Container(
  //           height: 100,
  //           child: Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               CircleAvatar(
  //                 radius: 45,
  //                 backgroundImage: Image.asset(
  //                   imageLink,
  //                   fit: BoxFit.cover,
  //                 ).image,
  //               ),
  //               Positioned(
  //                   bottom: 0,
  //                   child: Stack(
  //                     alignment: Alignment.center,
  //                     children: [
  //                       Image.asset(
  //                         iconLink,
  //                         height: 30,
  //                         width: 30,
  //                       ),
  //                       Text(
  //                         "$number",
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.w600),
  //                       )
  //                     ],
  //                   ))
  //             ],
  //           ),
  //         ),
  //       ),
  //       Text(
  //         name,
  //         style: TextStyle(fontSize: 10),
  //       ),
  //       RichText(
  //           text: TextSpan(children: [
  //         TextSpan(
  //             text: "$points ",
  //             style: TextStyle(
  //                 fontSize: 18,
  //                 color: Color(0xffFC7F0C),
  //                 fontWeight: FontWeight.bold)),
  //         TextSpan(
  //             text: S.current.points,
  //             style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.bold,
  //                 color: Theme.of(context).textTheme.headline6.color)),
  //       ]))
  //     ],
  //   );
  // }
  //
  // _itemLeaderBoard(BuildContext context, int index) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     child: Row(
  //       children: [
  //         Text(
  //           "${index + 4}",
  //           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         CircleAvatar(
  //           radius: 18,
  //           backgroundImage: Image.asset(
  //             listLeaderBoard[index].imageLink,
  //             fit: BoxFit.cover,
  //           ).image,
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Text(
  //           "${listLeaderBoard[index].name}",
  //           style: TextStyle(
  //             fontSize: 12,
  //           ),
  //         ),
  //         Spacer(),
  //         RichText(
  //             text: TextSpan(children: [
  //           TextSpan(
  //               text: "${1920 - index} ",
  //               style: TextStyle(
  //                   fontSize: 16,
  //                   color: Color(0xffFC7F0C),
  //                   fontWeight: FontWeight.bold)),
  //           TextSpan(
  //               text: S.current.points,
  //               style: TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.bold,
  //                   color: Theme.of(context).textTheme.headline6.color)),
  //         ]))
  //       ],
  //     ),
  //   );
  // }
  //
  // var listLeaderBoard = [
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  //   LeaderBoard(
  //       name: "Jessica Lambert",
  //       imageLink: ImageLinks().reviewer1,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Anna White", imageLink: ImageLinks().reviewer2, points: 1920),
  //   LeaderBoard(
  //       name: "Julia  Philips",
  //       imageLink: ImageLinks().reviewer3,
  //       points: 1920),
  //   LeaderBoard(
  //       name: "Alex Stanton", imageLink: ImageLinks().avatar1, points: 1920),
  //   LeaderBoard(
  //       name: "Alan Cooper", imageLink: ImageLinks().avatar2, points: 1920),
  //   LeaderBoard(
  //       name: "Marcus Levin", imageLink: ImageLinks().avatar3, points: 1920),
  // ];
}

// class LeaderBoard {
//   final String imageLink;
//   final String name;
//   final int points;
//
//   LeaderBoard({this.imageLink, this.name, this.points});
// }
