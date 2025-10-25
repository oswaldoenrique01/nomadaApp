import 'package:flutter_test/flutter_test.dart';
import 'package:nomadaapp/core/models/user_model.dart';
import 'package:nomadaapp/features/register/infrastructure/register_gateway_impl.dart';

void main() {
  group('RegisterGatewayImpl', () {
    late RegisterGatewayImpl registerGateway;

    setUp(() {
      registerGateway = RegisterGatewayImpl();
    });

    group('register', () {
      test('should return user when registration is successful', () async {
        final user = UserModel(
          name: 'John',
          lastName: 'Doe',
          birthdate: DateTime(1990, 1, 1),
          address: [],
        );

        final result = await registerGateway.register(userModel: user);

        expect(result.$1, isNull);
        expect(result.$2, equals(user));
        expect(result.$2?.name, equals('John'));
        expect(result.$2?.lastName, equals('Doe'));
      });

      test('should return error when user name is "OswaldoError"', () async {
        final user = UserModel(
          name: 'OswaldoError',
          lastName: 'Test',
          birthdate: DateTime(1990, 1, 1),
          address: [],
        );

        final result = await registerGateway.register(userModel: user);

        expect(result.$1, isNotNull);
        expect(result.$2, isNull);
        expect(result.$1?.title, equals('Oops, algo salió mal'));
        expect(result.$1?.message, equals('Ha ocurrido un error inesperado. Por favor, inténtalo de nuevo.'));
      });

      test('should return same user object that was passed', () async {
        final user = UserModel(
          name: 'Jane',
          lastName: 'Smith',
          birthdate: DateTime(1985, 5, 15),
          address: [],
        );

        final result = await registerGateway.register(userModel: user);

        expect(result.$2, same(user));
        expect(result.$2?.birthdate, equals(DateTime(1985, 5, 15)));
      });

      test('should handle empty user data', () async {
        final user = UserModel.empty();

        final result = await registerGateway.register(userModel: user);

        expect(result.$1, isNull);
        expect(result.$2, equals(user));
        expect(result.$2?.name, equals(''));
        expect(result.$2?.lastName, equals(''));
      });
    });
  });
}