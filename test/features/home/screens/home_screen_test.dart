import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadaapp/features/home/screens/home_screen.dart';
import 'package:nomadaapp/core/router/app_router.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should display welcome message and app name', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HomeScreen(),
        ),
      );

      expect(find.text('Bienvenido a'), findsOneWidget);
      expect(find.text('Nomada App'), findsOneWidget);
      expect(find.text('Tu compañero perfecto para explorar el mundo.\nDescubre nuevos lugares y vive experiencias únicas.'), findsOneWidget);
    });

    testWidgets('should display register button with correct text and icon', (WidgetTester tester) async {
      final mockGoRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => const Scaffold(body: Text('Register Screen')),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: mockGoRouter,
        ),
      );

      expect(find.text('Comenzar Registro'), findsOneWidget);
      expect(find.byIcon(Icons.person_add), findsOneWidget);
      
      final registerButton = find.byType(ElevatedButton);
      expect(registerButton, findsOneWidget);
    });
  });
}