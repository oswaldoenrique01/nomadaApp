import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';

class CustomAvatar extends StatelessWidget {
  final double size;
  final Color? backgroundColor;
  final IconData? icon;
  final String? imageUrl;
  final String? initials;
  final Color? iconColor;
  final List<BoxShadow>? boxShadow;

  const CustomAvatar({
    super.key,
    this.size = AppSizes.avatarMedium,
    this.backgroundColor,
    this.icon,
    this.imageUrl,
    this.initials,
    this.iconColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null
          ? Center(
              child: initials != null
                  ? Text(
                      initials!,
                      style: TextStyle(
                        color: iconColor ?? Colors.white,
                        fontSize: size * 0.4,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      icon ?? Icons.person,
                      size: size * 0.5,
                      color: iconColor ?? Colors.white,
                    ),
            )
          : null,
    );
  }
}