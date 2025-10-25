import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/models/user_model.dart';

abstract class RegisterGateway {
  Future<(ErrorModel?, UserModel?)> register({required UserModel userModel});
}
