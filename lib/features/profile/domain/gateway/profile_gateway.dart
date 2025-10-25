import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/models/user_model.dart';

import '../../../../core/models/address_model.dart';

abstract class ProfileGateway {
  Future<(ErrorModel?, bool)> addAddress(AddressModel addressModel);

  Future<(ErrorModel?, bool)> updateAddress(AddressModel addressModel);

  Future<(ErrorModel?, bool)> deleteAddress(AddressModel addressModel);
}
