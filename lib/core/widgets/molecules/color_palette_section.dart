import 'package:flutter/material.dart';
import '../atoms/color_chip.dart';
import '../atoms/custom_card.dart';
import '../../constants/app_sizes.dart';

class ColorPaletteSection extends StatelessWidget {
  final String title;
  final List<ColorData> colors;
  final EdgeInsetsGeometry? padding;

  const ColorPaletteSection({
    super.key,
    required this.title,
    required this.colors,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: AppSizes.size2),
          Wrap(
            spacing: AppSizes.size1,
            runSpacing: AppSizes.size1,
            children: colors
                .map((colorData) => ColorChip(
                      color: colorData.color,
                      label: colorData.label,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ColorData {
  final Color color;
  final String label;

  const ColorData({
    required this.color,
    required this.label,
  });
}