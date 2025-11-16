import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBookImageLoadingIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child:Container(color: Colors.grey[100],),
        ),
      ),
    );
  }
}