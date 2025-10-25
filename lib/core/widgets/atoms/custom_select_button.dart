import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/app_colors.dart';

class CustomSelectButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;

  const CustomSelectButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.enabled = true,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.contentPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.surface,
            border: Border.all(
              color: borderColor ?? AppColors.divider,
              width: 1,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
          ),
          child: Padding(
            padding: contentPadding ?? 
                const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingM,
                  vertical: AppSizes.paddingS,
                ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    color: enabled 
                        ? (textColor ?? AppColors.primary)
                        : AppColors.textHint,
                    size: AppSizes.iconMedium,
                  ),
                  const SizedBox(width: AppSizes.size2),
                ],
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: enabled 
                          ? (textColor ?? AppColors.primary)
                          : AppColors.textHint,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: enabled 
                      ? AppColors.textSecondary 
                      : AppColors.textHint,
                  size: AppSizes.iconSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}