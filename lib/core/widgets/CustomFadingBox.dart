import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFadingBox extends StatefulWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const CustomFadingBox({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  @override
  State<CustomFadingBox> createState() => _CustomFadingBoxState();
}

class _CustomFadingBoxState extends State<CustomFadingBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
