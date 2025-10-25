import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:nomadaapp/core/models/address_model.dart';
import '../router/app_router.dart';

class NavigationService {
  static void goHome(BuildContext context) {
    context.go(AppRouter.home);
  }

  static void goToRegister(BuildContext context) {
    context.pushReplacementNamed(AppRouter.register);
  }

  static Future<T?> goToAddAddress<T>(
    BuildContext context, {
    AddressModel? address,
    bool isEdit = false,
  }) {
    return context.pushNamed(
      AppRouter.addAddress,
      extra: {'address': address, 'isEdit': isEdit},
    );
  }

  static void goToProfile(BuildContext context) {
    context.go(AppRouter.profile);
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}
