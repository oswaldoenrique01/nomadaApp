import 'package:nomadaapp/features/register/domain/gateway/register_gateway.dart';

import '../../../../core/models/error_model.dart';
import '../../../../core/models/user_model.dart';

class RegisterUseCase {
  final RegisterGateway registerGateway;

  RegisterUseCase({required this.registerGateway});

  Future<(ErrorModel?, UserModel?)> register({required UserModel userModel}) async=>
      registerGateway.register(userModel: userModel);
}
