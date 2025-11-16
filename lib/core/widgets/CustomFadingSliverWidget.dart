import 'package:flutter/material.dart';

class CustomFadingSliver extends StatefulWidget {
  final Widget sliver;

  const CustomFadingSliver({super.key, required this.sliver});

  @override
  State<CustomFadingSliver> createState() => _CustomFadingSliverState();
}

class _CustomFadingSliverState extends State<CustomFadingSliver>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);

    _animation =
        Tween<double>(begin: 0.3, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SliverOpacity(
          opacity: _animation.value,
          sliver: widget.sliver,
        );
      },
    );
  }
}
