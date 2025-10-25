import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomSnack {
  static showSnack(
    BuildContext context, {
    bool hasError = false,
    String? message,
    Color backgroundColor = AppColors.success,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message ?? '¡Ha funcionado exitosamente!',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.background,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
