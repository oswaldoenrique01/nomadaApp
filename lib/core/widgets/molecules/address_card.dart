import 'package:flutter/material.dart';
import '../atoms/custom_card.dart';
import '../../constants/app_sizes.dart';
import '../../theme/app_colors.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const AddressCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onEdit,
    this.onDelete,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: padding ?? const EdgeInsets.all(AppSizes.paddingM),
      borderRadius: borderRadius,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (onEdit != null || onDelete != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onEdit != null)
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined),
                    color: AppColors.primary,
                  ),
                if (onDelete != null)
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline),
                    color: AppColors.textSecondary,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}