import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/color.dart';

class ContainerShadow extends StatelessWidget {
  final Widget child;
  double? width;
  EdgeInsetsGeometry? padding, margin;

  ContainerShadow({
    Key? key,
    required this.child,
    this.width,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: KColor.backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: .25,
            spreadRadius: 1,
            offset: Offset(1, 2),
          ),
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: .25,
            spreadRadius: 1.5,
            offset: Offset(-.5, -.5),
          )
        ],
      ),
      child: child,
    );
  }
}

class ContainerShadowRounded extends StatelessWidget {
  final Widget child;
  double? width;
  EdgeInsetsGeometry? padding, margin;
  ContainerShadowRounded({
    Key? key,
    required this.child,
    this.width,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: KColor.backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: .25,
            spreadRadius: 1,
            offset: Offset(1, 2),
          ),
          // BoxShadow(
          //   color: Colors.grey.shade300,
          //   blurRadius: .25,
          //   spreadRadius: 1.5,
          //   offset: Offset(-.5, -.5),
          // )
        ],
      ),
      child: child,
    );
  }
}
