// newst_books_list_view_loading_indicator.dart
import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/widgets/CustomFadingBox.dart';
import 'package:bookly_app/core/widgets/CustomFadingSliverWidget.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookRatingWidgt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNewstBookLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2.5 / 4,
          child: CustomFadingBox(
            height: double.infinity,
            width: double.infinity,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان
              CustomFadingBox(
                height: 16,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const SizedBox(height: 8),

              // السب تايتل
              CustomFadingBox(
                height: 14,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              const SizedBox(height: 8),

              // rating
              Row(
                children: [
                  CustomFadingBox(height: 14, width: 40),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
