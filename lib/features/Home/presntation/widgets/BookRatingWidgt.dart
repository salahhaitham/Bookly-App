import 'package:bookly_app/core/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookRatingWidget extends StatelessWidget {
  BookRatingWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,

  });
  MainAxisAlignment mainAxisAlignment;
  final double rating;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amberAccent),
        SizedBox(width: 3.6),
        Text(rating.toStringAsFixed(1), style: Styles.textstyle18),
        SizedBox(width: 3.6),
        Opacity(opacity: 0.7, child: Text("(245)", style: Styles.textstyle18)),
      ],
    );
  }
}
