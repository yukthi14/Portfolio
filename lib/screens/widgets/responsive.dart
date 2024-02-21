import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Color color;
  final double paddingWidth;

  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.color,
      required this.paddingWidth});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        return Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height * 1.6,
          color: color,
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.2, horizontal: paddingWidth),
          child: mobile,
        );
      } else if (constraints.maxWidth < 1300) {
        return Container(
          alignment: Alignment.center,
          width: size.width,
          // height: size.height,
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.3, horizontal: paddingWidth),
          color: color,
          child: tablet,
        );
      } else {
        return Container(
          alignment: Alignment.center,
          width: size.width,
          // height: size.height,
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.3, horizontal: paddingWidth),
          color: color,
          child: desktop,
        );
      }
    });
  }
}
