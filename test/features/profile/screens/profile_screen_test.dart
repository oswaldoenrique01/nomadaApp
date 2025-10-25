import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadaapp/features/profile/widgets/profile_header.dart';
import 'package:nomadaapp/core/widgets/widgets.dart';

void main() {
  group('ProfileScreen Widget Tests', () {
    testWidgets('should display ProfileHeader widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ProfileHeader(
                name: 'John Doe',
                subtitle: '01/01/1990',
                avatarInitials: 'J',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ProfileHeader), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('01/01/1990'), findsOneWidget);
      expect(find.text('J'), findsOneWidget);
    });

    testWidgets('should display action buttons in CustomButton widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  CustomButton(
                    text: 'Agregar dirección',
                    icon: Icons.add,
                    onPressed: () {},
                  ),
                  CustomButton(
                    text: 'Cerrar sesión',
                    icon: Icons.logout,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Agregar dirección'), findsOneWidget);
      expect(find.text('Cerrar sesión'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
    });
  });
}