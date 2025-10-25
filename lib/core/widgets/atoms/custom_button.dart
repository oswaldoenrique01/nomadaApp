import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';

enum ButtonType { elevated, outlined, text, filled }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.elevated,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle(context);
    final child = _buildButtonChild();

    if (width != null) {
      return SizedBox(
        width: width,
        child: _buildButton(buttonStyle, child),
      );
    }

    return _buildButton(buttonStyle, child);
  }

  Widget _buildButton(ButtonStyle style, Widget child) {
    switch (type) {
      case ButtonType.elevated:
        return icon != null
            ? ElevatedButton.icon(
                onPressed:  onPressed,
                style: style,
                icon: Icon(icon),
                label: child,
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: style,
                child: child,
              );
      case ButtonType.outlined:
        return icon != null
            ? OutlinedButton.icon(
                onPressed: onPressed,
                style: style,
                icon: Icon(icon),
                label: child,
              )
            : OutlinedButton(
                onPressed: onPressed,
                style: style,
                child: child,
              );
      case ButtonType.text:
        return icon != null
            ? TextButton.icon(
                onPressed: onPressed,
                style: style,
                icon: Icon(icon),
                label: child,
              )
            : TextButton(
                onPressed: onPressed,
                style: style,
                child: child,
              );
      case ButtonType.filled:
        return icon != null
            ? FilledButton.icon(
                onPressed: onPressed,
                style: style,
                icon: Icon(icon),
                label: child,
              )
            : FilledButton(
                onPressed: onPressed,
                style: style,
                child: child,
              );
    }
  }

  Widget _buildButtonChild() {
    return Text(text);
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: backgroundColor != null
          ? WidgetStateProperty.all(backgroundColor)
          : null,
      foregroundColor: foregroundColor != null
          ? WidgetStateProperty.all(foregroundColor)
          : null,
      padding: padding != null
          ? WidgetStateProperty.all(padding)
          : WidgetStateProperty.all(EdgeInsets.symmetric(vertical: AppSizes.paddingMedium)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusXL),
        ),
      ),
    );
  }
}