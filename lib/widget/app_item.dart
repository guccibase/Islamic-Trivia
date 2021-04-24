import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppItem extends StatefulWidget {
  final String imageLink;
  final String name;
  final Widget navigationTo;
  final int index;

  const AppItem({Key key,
   @required this.imageLink,
  @required this.name,
  @required this.navigationTo, this.index}) : super(key: key);
  @override
  _AppItemState createState() => _AppItemState();
}

class _AppItemState extends State<AppItem> with TickerProviderStateMixin{
  AnimationController _animationController;
  Animation<Offset> _translateAnimation;
  Animation<double> _opacityAnimation;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.index*100+1500));
    _translateAnimation = Tween<Offset>(begin: Offset(0,100),end: Offset.zero).animate(CurvedAnimation(curve: Curves.easeOutCubic,parent: _animationController));
    _opacityAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context,child){
        return Transform.translate(
            offset: _translateAnimation.value,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child){
            return FadeTransition(
              opacity: _opacityAnimation,
              child: child,
            );
          },
          child: child,
        )
        );
      },
    child:  GestureDetector(
      onTap: (){
        pushNewScreen(context,
            screen: widget.navigationTo,
            withNavBar: false
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).shadowColor,
                            offset: Offset(2,2),
                            blurRadius: 4
                        ),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.imageLink)
                      )
                  ),
                )),
            Expanded(
                flex: 2,
                child: Text(widget.name, textAlign:TextAlign.center ,style: Theme.of(context).textTheme.bodyText1,)),
          ],
        ),
      ),
    ),);
  }
}
