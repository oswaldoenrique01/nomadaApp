import 'package:flutter/material.dart';
import '../atoms/custom_avatar.dart';
import '../atoms/gradient_container.dart';
import '../../theme/app_colors.dart';

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
    return GradientContainer(
      height: height,
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
                size: 120,
                backgroundColor: AppColors.accent,
                imageUrl: avatarUrl,
                initials: avatarInitials,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(51),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
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