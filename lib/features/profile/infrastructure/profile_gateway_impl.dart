import 'package:nomadaapp/core/models/address_model.dart';
import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/features/profile/domain/gateway/profile_gateway.dart';

class ProfileGatewayImpl implements ProfileGateway {
  @override
  Future<(ErrorModel?, bool)> deleteAddress(AddressModel addressModel) async {
    return (null, true);
  }

  @override
  Future<(ErrorModel?, bool)> updateAddress(AddressModel addressModel) async {
    return (null, true);
  }

  @override
  Future<(ErrorModel?, bool)> addAddress(AddressModel addressModel) async{
    return (null, true);
  }
}
