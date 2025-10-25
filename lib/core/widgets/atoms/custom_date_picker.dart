import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/app_colors.dart';
import '../../utils/date_utils.dart' as date_utils;

class CustomDatePicker extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? errorText;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;

  const CustomDatePicker({
    super.key,
    this.labelText,
    this.hintText,
    this.selectedDate,
    this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.errorText,
    this.enabled = true,
    this.contentPadding,
    this.borderRadius,
  });

  String _formatDate(DateTime date) {
    return date_utils.DateUtils.formatDate(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    if (!enabled) return;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: errorText != null 
                ? AppColors.error 
                : AppColors.divider,
            width: errorText != null ? 2 : 1,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
          color: enabled ? AppColors.surface : AppColors.background,
        ),
        child: Padding(
          padding: contentPadding ?? 
              const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingM,
                vertical: AppSizes.paddingS,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (labelText != null) ...[
                Text(
                  labelText!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: errorText != null 
                        ? AppColors.error 
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSizes.size1 / 2),
              ],
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: enabled 
                        ? (errorText != null ? AppColors.error : AppColors.textSecondary)
                        : AppColors.textHint,
                    size: AppSizes.iconMedium,
                  ),
                  const SizedBox(width: AppSizes.size2),
                  Expanded(
                    child: Text(
                      selectedDate != null 
                          ? _formatDate(selectedDate!)
                          : (hintText ?? 'Seleccionar fecha'),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: selectedDate != null 
                            ? (enabled ? AppColors.textPrimary : AppColors.textHint)
                            : AppColors.textHint,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: enabled 
                        ? AppColors.textSecondary 
                        : AppColors.textHint,
                  ),
                ],
              ),
              if (errorText != null) ...[
                const SizedBox(height: AppSizes.size1 / 2),
                Text(
                  errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}