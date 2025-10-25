import 'package:flutter/material.dart';
import '../atoms/custom_card.dart';
import '../../constants/app_sizes.dart';

class TextStyleShowcase extends StatelessWidget {
  final String title;
  final List<TextStyleData> textStyles;
  final EdgeInsetsGeometry? padding;

  const TextStyleShowcase({
    super.key,
    required this.title,
    required this.textStyles,
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
          ...textStyles.map((styleData) => Padding(
                padding: EdgeInsets.only(bottom: AppSizes.size1),
                child: Text(
                  styleData.label,
                  style: styleData.textStyle,
                ),
              )),
        ],
      ),
    );
  }
}

class TextStyleData {
  final TextStyle textStyle;
  final String label;

  const TextStyleData({
    required this.textStyle,
    required this.label,
  });
}