import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nomadaapp/core/core.dart';
import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/widgets/atoms/custom_snack.dart';
import 'package:nomadaapp/features/profile/screens/interface/profile_interface.dart';
import 'package:nomadaapp/features/profile/screens/presenter/profile_presenter.dart';
import 'package:nomadaapp/features/profile/screens/provider/profile_provider.dart';
import 'package:nomadaapp/features/register/screens/provider/register_provider.dart';
import '../../../core/models/address_model.dart';
import '../../../core/widgets/error_modal.dart';
import '../../../core/widgets/molecules/loading_modal.dart';
import '../widgets/profile_header.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    implements ProfileInterface {
  late final ProfilePresenter _presenter;

  @override
  void initState() {
    final useCase = ref.read(profileProviderNotifier.notifier).profileUseCase;
    _presenter = ProfilePresenter(profileUseCase: useCase, interface: this);
    super.initState();
  }

  void _handleAddAddress({
    AddressModel? address,
    bool isEdit = false,
    int index = 0,
  }) async {
    final result = await NavigationService.goToAddAddress<AddressModel>(
      context,
      address: address,
      isEdit: isEdit,
    );

    if (result != null && mounted) {
      if (isEdit) {
        final isUpdate = await _presenter.updateAddress(result);
        if (!isUpdate.$2) return;
        ref.read(profileProviderNotifier.notifier).updateAddress(index, result);
      } else {
        final isAdd = await _presenter.addAddress(result);
        if (!isAdd.$2) return;
        ref.read(profileProviderNotifier.notifier).addAddress(result);
      }

      CustomSnack.showSnack(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(profileProviderNotifier).user;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            ProfileHeader(
              name: '${user.name} ${user.lastName}',
              subtitle: DateFormat(
                'dd/MM/yyyy',
              ).format(user.birthdate ?? DateTime.now()),
              avatarInitials: user.name.isEmpty
                  ? ''
                  : user.name[0].toUpperCase(),
            ),

            Expanded(
              child: CustomCard(
                backgroundColor: AppColors.background,
                padding: const EdgeInsets.all(0),
                child: AddressList(
                  title: 'Mis direcciones',
                  addresses: user.address,
                  onEditAddress: (index) => _handleAddAddress(
                    address: user.address[index],
                    isEdit: true,
                    index: index,
                  ),
                  onDeleteAddress: (index) async {
                    final isDelete = await _presenter.addAddress(
                      user.address[index],
                    );
                    if (!isDelete.$2) return;
                    ref
                        .read(profileProviderNotifier.notifier)
                        .deleteAddress(index);
                    CustomSnack.showSnack(
                      context,
                      backgroundColor: AppColors.error,
                      message: '¡Has eliminado la dirección!',
                    );
                  },
                ),
              ),
            ),
            CustomCard(
              child: Column(
                children: [
                  CustomButton(
                    text: 'Agregar dirección',
                    icon: Icons.add,
                    onPressed: () => _handleAddAddress(),
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    width: double.infinity,
                  ),

                  SizedBox(height: AppSizes.spacingMedium),

                  CustomButton(
                    text: 'Cerrar sesión',
                    icon: Icons.logout,
                    onPressed: () {
                      ref.invalidate(registerProviderNotifier);
                      ref.invalidate(profileProviderNotifier);
                      NavigationService.goHome(context);
                    },
                    type: ButtonType.outlined,
                    foregroundColor: AppColors.error,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    LoadingModal.hide();
  }

  @override
  void showError(ErrorModel errorModel) {
    ErrorModal.show(context, errorModel);
  }

  @override
  void showLoading() {
    LoadingModal.show(context);
  }
}
