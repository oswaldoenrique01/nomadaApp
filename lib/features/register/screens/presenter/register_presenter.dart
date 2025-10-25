import 'package:nomadaapp/features/register/domain/use_case/register_use_case.dart';
import 'package:nomadaapp/features/register/screens/interface/register_interface.dart';

import '../../../../core/models/error_model.dart';
import '../../../../core/models/user_model.dart';

class RegisterPresenter {
  final RegisterInterface interface;
  final RegisterUseCase registerUseCase;

  RegisterPresenter({required this.registerUseCase, required this.interface});

  Future<(ErrorModel?, UserModel?)> register(UserModel userModel) async {
    interface.showLoader();

    final (error, user) = await registerUseCase.register(userModel: userModel);

    if (error != null) {
      interface.manageError(error);
      interface.hideLoader();

      return (error, null);
    }

    interface.hideLoader();
    return (null, user);
  }
}
