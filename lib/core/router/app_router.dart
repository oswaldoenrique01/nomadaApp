import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/register/screens/register_screen.dart';
import '../../features/address/screens/address_screen.dart';
import '../constants/app_sizes.dart';
import '../models/address_model.dart';

class AppRouter {
  static const String home = '/';
  static const String register = '/register';
  static const String addAddress = '/add-address';
  static const String profile = '/profile';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: register,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: addAddress,
        name: addAddress,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final address = args['address'] as AddressModel?;
          final isEdit = (args['isEdit'] as bool?) ?? false;
          return AddAddressScreen(addressModel: address, isEdit: isEdit);
        },
      ),
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: AppSizes.iconXLarge,
              color: Colors.red,
            ),
            SizedBox(height: AppSizes.spacingMedium),
            Text(
              'Página no encontrada',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.spacingSmall),
            Text(
              'La ruta "${state.uri}" no existe',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: AppSizes.spacingLarge),
            ElevatedButton(
              onPressed: () => context.go(home),
              child: const Text('Ir al inicio'),
            ),
          ],
        ),
      ),
    ),
  );
}
