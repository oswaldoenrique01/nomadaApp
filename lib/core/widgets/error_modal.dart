import 'package:flutter/material.dart';
import '../models/error_model.dart';

class ErrorModal extends StatelessWidget {
  final ErrorModel errorModel;

  const ErrorModal({
    super.key,
    required this.errorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            if (errorModel.title != null)
              Text(
                errorModel.title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            if (errorModel.title != null) const SizedBox(height: 12),
            if (errorModel.message != null)
              Text(
                errorModel.message!,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: errorModel.onTap ?? () => Navigator.of(context).pop(),
                child: Text(errorModel.btnLabel ?? 'Aceptar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show(BuildContext context, ErrorModel errorModel) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ErrorModal(errorModel: errorModel);
      },
    );
  }
}