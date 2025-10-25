import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';

class ColorChip extends StatelessWidget {
  final Color color;
  final String label;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const ColorChip({
    super.key,
    required this.color,
    required this.label,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall, vertical: AppSizes.paddingXS),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: _getContrastColor(color),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}