import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomadaapp/core/models/user_model.dart';

import '../../../../core/models/address_model.dart';
import '../../domain/injectors/profile_injector.dart';
import '../../domain/use_case/profile_use_case.dart';

part 'profile_provider.freezed.dart';

final profileProviderNotifier =
    StateNotifierProvider<ProfileProviderNotifier, ProfileState>((ref) {
      final user = ref.read(profileUserUseCaseProvider);
      return ProfileProviderNotifier(
        user,
        ProfileState(user: UserModel.empty()),
      );
    });

class ProfileProviderNotifier extends StateNotifier<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileProviderNotifier(this.profileUseCase, super.state);

  addAddress(AddressModel address) {
    final updatedAddresses = [...state.user.address, address];

    UserModel newUser = UserModel(
      name: state.user.name,
      lastName: state.user.lastName,
      address: updatedAddresses,
      birthdate: state.user.birthdate,
    );

    state = state.copyWith(user: newUser);
  }

  updateAddress(int index, AddressModel address) {

    final updateAddress = state.user.address;
    updateAddress[index] = address;

    UserModel newUser = UserModel(
      name: state.user.name,
      lastName: state.user.lastName,
      address: updateAddress,
      birthdate: state.user.birthdate,
    );

    state = state.copyWith(user: newUser);
  }

  deleteAddress(int index) {
    final List<AddressModel> updatedAddresses = state.user.address;
    updatedAddresses.removeAt(index);

    final newUser = UserModel(
      name: state.user.name,
      lastName: state.user.lastName,
      birthdate: state.user.birthdate,
      address: updatedAddresses,
    );

    state = state.copyWith(user: newUser);
  }

  setUser(UserModel user) {
    state = state.copyWith(user: user);
  }
}

@freezed
class ProfileState with _$ProfileState {
  @override
  final UserModel user;

  const ProfileState({required this.user});
}
