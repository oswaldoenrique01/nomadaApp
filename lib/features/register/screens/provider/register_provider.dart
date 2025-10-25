import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomadaapp/core/models/user_model.dart';
import 'package:nomadaapp/features/register/domain/injectors/register_injectors.dart';
import 'package:nomadaapp/features/register/domain/use_case/register_use_case.dart';

import '../../../../core/models/address_model.dart';

part 'register_provider.freezed.dart';

final registerProviderNotifier =
    StateNotifierProvider<RegisterProviderNotifier, RegisterState>((ref) {
      final user = ref.read(registerUserUseCaseProvider);
      return RegisterProviderNotifier(
        user,
        RegisterState(user: UserModel.empty()),
      );
    });

class RegisterProviderNotifier extends StateNotifier<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterProviderNotifier(this.registerUseCase, super.state);

  updateAddress(AddressModel address) {
    state = state.copyWith(
      user: UserModel(
        name: '',
        lastName: '',
        birthdate: DateTime.now(),
        address: [address],
      ),
    );
  }

}

@freezed
class RegisterState with _$RegisterState {
  @override
  final UserModel user;

  const RegisterState({required this.user});
}
