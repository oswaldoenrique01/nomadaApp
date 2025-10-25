import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/models/user_model.dart';
import 'package:nomadaapp/features/profile/domain/gateway/profile_gateway.dart';

import '../../../../core/models/address_model.dart';

class ProfileUseCase {
  final ProfileGateway profileGateway;

  ProfileUseCase({required this.profileGateway});

  Future<(ErrorModel?, bool)> addAddress(AddressModel addressModel) =>
      profileGateway.addAddress(addressModel);

  Future<(ErrorModel?, bool)> updateAddress(AddressModel addressModel) =>
      profileGateway.updateAddress(addressModel);

  Future<(ErrorModel?, bool)> deleteAddress(AddressModel addressModel) =>
      profileGateway.deleteAddress(addressModel);
}
