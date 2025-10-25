import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadaapp/features/register/screens/register_screen.dart';

void main() {
  group('RegisterScreen Widget Tests', () {
    testWidgets('should display welcome message and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const RegisterScreen(),
          ),
        ),
      );

      expect(find.text('¡Bienvenido!'), findsOneWidget);
      expect(find.text('Completa tu perfil para comenzar tu experiencia nómada'), findsOneWidget);
    });

    testWidgets('should display app bar with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const RegisterScreen(),
          ),
        ),
      );

      expect(find.text('Registro'), findsOneWidget);
      
      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);
    });
  });
}