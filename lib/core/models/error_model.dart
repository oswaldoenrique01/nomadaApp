import 'dart:ui';

class ErrorModel {
  final String? title;
  final String? message;
  final String? btnLabel;
  final VoidCallback? onTap;

  ErrorModel({this.title, this.message, this.btnLabel, this.onTap});
}
