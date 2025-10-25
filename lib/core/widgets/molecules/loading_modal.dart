import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/app_colors.dart';

class LoadingModal {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  static void show(BuildContext context, {String? message}) {
    if (_isShowing) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => _LoadingModalWidget(message: message),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isShowing = true;
  }

  static void hide() {
    if (!_isShowing || _overlayEntry == null) return;

    _overlayEntry!.remove();
    _overlayEntry = null;
    _isShowing = false;
  }

  static bool get isShowing => _isShowing;
}

class _LoadingModalWidget extends StatelessWidget {
  final String? message;

  const _LoadingModalWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(128),
      child: PopScope(
        canPop: false,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppSizes.paddingXL),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(51),
                  blurRadius: AppSizes.size2,
                  offset: Offset(0, AppSizes.size1 / 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  strokeWidth: AppSizes.size1 / 2,
                ),
                  const SizedBox(height: AppSizes.size4),
                  Text(
                    message ?? 'Cargando...',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
            ),
          ),
        ),
    );
  }
}