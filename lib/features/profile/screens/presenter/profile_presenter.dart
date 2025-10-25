import 'dart:math';

import 'package:nomadaapp/features/profile/domain/use_case/profile_use_case.dart';
import 'package:nomadaapp/features/profile/screens/interface/profile_interface.dart';

import '../../../../core/models/address_model.dart';
import '../../../../core/models/error_model.dart';

class ProfilePresenter {
  final ProfileUseCase profileUseCase;
  final ProfileInterface interface;

  ProfilePresenter({required this.profileUseCase, required this.interface});

  Future<(ErrorModel?, bool)> addAddress(AddressModel addressModel) async {
    interface.showLoading();
    final (error, result) = await profileUseCase.addAddress(addressModel);

    if (error != null) {
      interface.hideLoading();
      interface.showError(error);

      return (error, false);
    }

    interface.hideLoading();

    return (null, result);
  }

  Future<(ErrorModel?, bool)> updateAddress(AddressModel addressModel) async {
    interface.showLoading();
    final (error, result) = await profileUseCase.updateAddress(addressModel);

    if (error != null) {
      interface.hideLoading();
      interface.showError(error);

      return (error, false);
    }

    interface.hideLoading();

    return (null, result);
  }

  Future<(ErrorModel?, bool)> deleteAddress(AddressModel addressModel) async {
    interface.showLoading();
    final (error, result) = await profileUseCase.deleteAddress(addressModel);

    if (error != null) {
      interface.hideLoading();
      interface.showError(error);

      return (error, false);
    }

    interface.hideLoading();

    return (null, result);
  }
}
