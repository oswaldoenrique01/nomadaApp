import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadaapp/features/register/infrastructure/register_gateway_impl.dart';
import 'package:nomadaapp/features/register/domain/use_case/register_use_case.dart';

final registerGatewayImplProvider = Provider((ref) => RegisterGatewayImpl());

final registerUserUseCaseProvider = Provider((ref) {
  final gatewayImpl = ref.read(registerGatewayImplProvider);
  return RegisterUseCase(registerGateway: gatewayImpl);
});