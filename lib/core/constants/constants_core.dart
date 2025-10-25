import '../models/error_model.dart';

class ConstantsCore{

  static ErrorModel get defaultError => ErrorModel(
    title: 'Oops, algo salió mal',
    message: 'Ha ocurrido un error inesperado. Por favor, inténtalo de nuevo.',
    btnLabel: 'Entendido',
  );
}