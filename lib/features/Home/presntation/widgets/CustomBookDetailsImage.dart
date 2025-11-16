import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 2.7/4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/Property 1=Variant38.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
