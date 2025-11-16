import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/Utils/AppRouter.dart';
import 'package:bookly_app/features/Home/presntation/views/Home_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'SlidingText.dart';

class SplashViewBody extends StatefulWidget {
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    InitSlideText();
    NavigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Image(image: AssetImage(klogo)),

        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void InitSlideText() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);



  }

  void NavigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
GoRouter.of(context).push(AppRouter.khomeview);
    });
  }

}

