import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_trivia/app/quiz/screens/levels_screen/levels_screen.dart';

class ItemCategory extends StatefulWidget {
  final int index;
  final String imageLink;
  final String name;
  final bool locked;
  const ItemCategory(
      {Key key, this.locked, this.imageLink, this.name, this.index})
      : super(key: key);
  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _translateAnimation;
  Animation<double> _fadeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.index * 100 + 600));
    _translateAnimation = Tween<Offset>(begin: Offset(0, 100), end: Offset.zero)
        .animate(_animationController);
    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: _translateAnimation.value,
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: child,
                );
              },
              child: child),
        );
      },
      child: Container(
        margin: widget.index % 3 != 1
            ? EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5)
            : EdgeInsets.only(left: 5, right: 5, top: 40, bottom: 5),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => widget.locked
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LevelsScreen(
                          title: widget.name,
                        ),
                      ),
                    ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        widget.locked ? Icons.lock : Icons.lock_open,
                        color: Colors.white,
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: widget.locked
                              ? ColorFilter.mode(Colors.black, BlendMode.color)
                              : null,
                          image: Image.asset(
                            widget.imageLink,
                            fit: BoxFit.cover,
                          ).image),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).shadowColor,
                            offset: Offset(2, 2),
                            blurRadius: 4)
                      ]),
                ),
              ),
            ),
            Text(
              widget.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
