import 'package:flutter/cupertino.dart';

class CustomFadingWidget extends StatefulWidget{
final Widget child;

  const CustomFadingWidget({super.key, required this.child});
  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
@override
  void initState() {
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds:700 ));

    animation=Tween<double>(begin: 0.2,end: 0.8).animate(animationController);
    animationController.addListener(() {
      setState(() {

      });
    },);
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();// TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context)  {
    // TODO: implement build
    return Opacity(opacity:animation.value  ,

    child: widget.child,);
  }
}