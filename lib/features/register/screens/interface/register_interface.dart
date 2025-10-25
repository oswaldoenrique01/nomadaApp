import 'package:nomadaapp/core/models/error_model.dart';

abstract class RegisterInterface{
  void showLoader();
  void hideLoader();
  void manageError(ErrorModel error);
}