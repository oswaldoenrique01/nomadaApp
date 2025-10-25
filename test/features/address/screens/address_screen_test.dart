import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadaapp/features/address/screens/address_screen.dart';
import 'package:nomadaapp/core/models/address_model.dart';

void main() {
  group('AddAddressScreen Widget Tests', () {
    testWidgets('should display "Agregar Dirección" title when not editing', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const AddAddressScreen(
              addressModel: null,
              isEdit: false,
            ),
          ),
        ),
      );

      expect(find.text('Agregar Dirección'), findsOneWidget);
      expect(find.text('Nueva Dirección'), findsOneWidget);
      expect(find.text('Completa la información de tu dirección para continuar'), findsOneWidget);
    });

    testWidgets('should display "Editar Dirección" title when editing', (WidgetTester tester) async {
      final mockAddress = AddressModel(
        country: 'Test Country',
        department: 'Test Department',
        municipality: 'Test Municipality',
        address: 'Test Address 123',
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AddAddressScreen(
              addressModel: mockAddress,
              isEdit: true,
            ),
          ),
        ),
      );

      expect(find.text('Editar Dirección'), findsOneWidget);
      expect(find.text('Nueva Dirección'), findsOneWidget);
    });
  });
}