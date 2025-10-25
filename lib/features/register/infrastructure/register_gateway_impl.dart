import 'package:nomadaapp/core/constants/constants_core.dart';
import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/models/user_model.dart';
import 'package:nomadaapp/features/register/domain/gateway/register_gateway.dart';

class RegisterGatewayImpl implements RegisterGateway {
  @override
  Future<(ErrorModel?, UserModel?)> register({
    required UserModel userModel,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (userModel.name == 'OswaldoError') {
        throw Exception();
      }

      return (null, userModel);
    } catch (e) {
      return (ConstantsCore.defaultError, null);
    }
  }
}
