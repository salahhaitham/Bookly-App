import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final bool isNetwork = imagePath.startsWith("http");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: isNetwork
              ? CachedNetworkImage(
            imageUrl: imagePath,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          )
              : Container(
            color: Colors.grey[300],
            child: Icon(
              Icons.book_outlined,
              size: 40,
              color: Colors.grey[700],
            ),
          )

        ),
      ),
    );
  }
}
