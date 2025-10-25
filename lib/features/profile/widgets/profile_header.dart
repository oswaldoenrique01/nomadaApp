import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/atoms/custom_avatar.dart';
import '../../../core/widgets/atoms/gradient_container.dart';
import '../../../core/constants/app_sizes.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String subtitle;
  final String? avatarUrl;
  final String? avatarInitials;
  final double height;
  final Gradient? gradient;
  final VoidCallback? onAvatarTap;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.subtitle,
    this.avatarUrl,
    this.avatarInitials,
    this.height = 300,
    this.gradient,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GradientContainer(
      height: height,
      width: width,
      borderRadius: BorderRadius.zero,
      gradient: gradient ??
          const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onAvatarTap,
              child: CustomAvatar(
                size: AppSizes.avatarLarge,
                backgroundColor: AppColors.accent,
                imageUrl: avatarUrl,
                initials: avatarInitials,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(51),
                    blurRadius: AppSizes.size2,
                    offset: Offset(0, AppSizes.size1 / 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.spacingLarge),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spacingSmall),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white.withAlpha(230),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}