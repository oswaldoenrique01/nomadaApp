import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/models/user_model.dart';

abstract class ProfileInterface {
  void showLoading();
  void hideLoading();
  void showError(ErrorModel errorModel);
}