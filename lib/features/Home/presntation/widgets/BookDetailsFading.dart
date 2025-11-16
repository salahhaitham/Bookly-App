import 'package:bookly_app/core/widgets/CustomFadingBox.dart';
import 'package:flutter/cupertino.dart';

class BookDetails_Fading extends StatelessWidget {
  const BookDetails_Fading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 50),

          CustomFadingBox(
            height: MediaQuery.of(context).size.height * 0.36,
            width: MediaQuery.of(context).size.width * 0.475,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(height: 45),

          CustomFadingBox(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 8),

          // اسم المؤلف
          Center(
            child: CustomFadingBox(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.4,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 15),

          // Rating / Price
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFadingBox(height: 16, width: 40, borderRadius: BorderRadius.circular(8)),
              const SizedBox(width: 16),
              CustomFadingBox(height: 16, width: 60, borderRadius: BorderRadius.circular(8)),
            ],
          ),
          const SizedBox(height: 45),
          CustomFadingBox(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.8,
            borderRadius: BorderRadius.circular(16),
          ),
        ],
      ),
    );
  }
}
