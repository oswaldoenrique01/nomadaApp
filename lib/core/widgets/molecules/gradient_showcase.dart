import 'package:flutter/material.dart';
import '../atoms/gradient_container.dart';
import '../atoms/custom_card.dart';
import '../../constants/app_sizes.dart';

class GradientShowcase extends StatelessWidget {
  final String title;
  final List<GradientData> gradients;
  final EdgeInsetsGeometry? padding;

  const GradientShowcase({
    super.key,
    required this.title,
    required this.gradients,
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
          ...gradients.map((gradientData) => Padding(
                padding: EdgeInsets.only(bottom: AppSizes.size1),
                child: GradientContainer(
                  height: AppSizes.size8,
                  gradient: gradientData.gradient,
                  child: Center(
                    child: Text(
                      gradientData.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class GradientData {
  final Gradient gradient;
  final String label;

  const GradientData({
    required this.gradient,
    required this.label,
  });
}