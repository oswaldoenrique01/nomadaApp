import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadaapp/features/profile/domain/use_case/profile_use_case.dart';

import '../../infrastructure/profile_gateway_impl.dart';

final profileGatewayImplProvider = Provider((ref) => ProfileGatewayImpl());

final profileUserUseCaseProvider = Provider((ref) {
  final gatewayImpl = ref.read(profileGatewayImplProvider);
  return ProfileUseCase(profileGateway: gatewayImpl);
});