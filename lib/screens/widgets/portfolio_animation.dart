import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';

class PortfolioAnimation extends StatefulWidget {
  const PortfolioAnimation({super.key});

  @override
  State<PortfolioAnimation> createState() => _PortfolioAnimationState();
}

class _PortfolioAnimationState extends State<PortfolioAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
    _animation = Tween(begin: const Offset(0, 0.1), end: const Offset(0, 0.2))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: AppColor.bgColor,
          image: DecorationImage(
              image: AssetImage(AppAssets.profileImage), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
