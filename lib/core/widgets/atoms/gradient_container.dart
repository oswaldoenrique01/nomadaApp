import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const GradientContainer({
    super.key,
    required this.child,
    required this.gradient,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusS),
      ),
      child: child,
    );
  }
}