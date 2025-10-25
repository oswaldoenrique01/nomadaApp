import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadaapp/core/models/address_model.dart';
import 'package:nomadaapp/core/models/error_model.dart';
import 'package:nomadaapp/core/models/user_model.dart';
import 'package:nomadaapp/features/profile/screens/provider/profile_provider.dart';
import 'package:nomadaapp/features/register/screens/interface/register_interface.dart';
import 'package:nomadaapp/features/register/screens/presenter/register_presenter.dart';
import 'package:nomadaapp/features/register/screens/provider/register_provider.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_utils.dart' as date_utils;
import '../../../core/widgets/atoms/custom_button.dart';
import '../../../core/widgets/atoms/custom_date_picker.dart';
import '../../../core/widgets/atoms/custom_select_button.dart';
import '../../../core/widgets/atoms/custom_text_field.dart';
import '../../../core/widgets/error_modal.dart';
import '../../../core/widgets/molecules/address_card.dart';
import '../../../core/widgets/molecules/loading_modal.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm>
    implements RegisterInterface {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  late final RegisterPresenter _presenter;

  DateTime? _selectedBirthDate;
  AddressModel? _selectedAddress;
  String? _birthDateError;
  bool addressHasError = false;

  @override
  void initState() {
    final useCase = ref.read(registerProviderNotifier.notifier).registerUseCase;
    _presenter = RegisterPresenter(registerUseCase: useCase, interface: this);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es requerido';
    }
    if (value.trim().length < 2) {
      return 'Debe tener al menos 2 caracteres';
    }
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value.trim())) {
      return 'Solo se permiten letras';
    }
    return null;
  }

  bool _validateBirthDate() {
    if (_selectedBirthDate == null) {
      setState(() {
        _birthDateError = 'La fecha de nacimiento es requerida';
      });
      return false;
    }

    if (!date_utils.DateUtils.isValidAge(_selectedBirthDate!)) {
      final age = date_utils.DateUtils.calculateAge(_selectedBirthDate!);
      setState(() {
        if (age < 13) {
          _birthDateError = 'Debes tener al menos 13 años';
        } else {
          _birthDateError = 'Por favor verifica la fecha';
        }
      });
      return false;
    }

    setState(() {
      _birthDateError = null;
    });
    return true;
  }

  void _handleAddAddress({AddressModel? address, bool isEdit = false}) async {
    final result = await NavigationService.goToAddAddress<AddressModel>(
      context,
      address: address,
      isEdit: isEdit,
    );

    if (result != null) {
      _selectedAddress = result;
      ref.read(registerProviderNotifier.notifier).updateAddress(result);
    }
  }

  void _onBirthDateSelected(DateTime date) {
    setState(() {
      _selectedBirthDate = date;
      _birthDateError = null;
    });

    _validateBirthDate();
  }

  bool _isValidAddress(AddressModel? address) {
    if (address == null) {
      addressHasError = true;

      return false;
    }
    if (address.address.isEmpty ||
        address.municipality.isEmpty ||
        address.department.isEmpty ||
        address.country.isEmpty) {
      addressHasError = true;

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = ref.watch(registerProviderNotifier);
    final user = registerProvider.user;
    final address = user.address;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            controller: _firstNameController,
            labelText: 'Nombre',
            hintText: 'Ingresa tu nombre',
            keyboardType: TextInputType.name,
            validator: _validateName,
            prefixIcon: const Icon(
              Icons.person_outline,
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(height: AppSizes.size3),

          CustomTextField(
            controller: _lastNameController,
            labelText: 'Apellido',
            hintText: 'Ingresa tu apellido',
            keyboardType: TextInputType.name,
            validator: _validateName,
            prefixIcon: const Icon(
              Icons.person_outline,
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(height: AppSizes.size3),

          CustomDatePicker(
            labelText: 'Fecha de nacimiento',
            hintText: 'Selecciona tu fecha de nacimiento',
            selectedDate: _selectedBirthDate,
            onDateSelected: _onBirthDateSelected,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            errorText: _birthDateError,
          ),

          SizedBox(height: AppSizes.size3),

          Consumer(
            builder: (context, ref, _) {
              if (address.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSelectButton(
                      text: '+ Agregar dirección',
                      icon: Icons.location_on,
                      onPressed: () => _handleAddAddress(),
                    ),
                    if (addressHasError)
                      Text(
                        'La direcciòn se encuentran vacìa',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                  ],
                );
              }

              final firstAddress = address.first;

              return AddressCard(
                title:
                    '${firstAddress.country}, ${firstAddress.department}, \n${firstAddress.municipality}',
                subtitle: firstAddress.address,
                onEdit: () => _handleAddAddress(address: firstAddress),
              );
            },
          ),

          SizedBox(height: AppSizes.size6),
          CustomButton(
            text: 'Registrar',
            onPressed: () async {
              final isFormValid = _formKey.currentState?.validate() ?? false;
              final isBirthDateValid = _validateBirthDate();
              final isValidAddress = _isValidAddress(_selectedAddress);

              if (!isFormValid || !isBirthDateValid || !isValidAddress) return;
              LoadingModal.show(context);
              final user = await _presenter.register(
                UserModel(
                  name: _firstNameController.text,
                  lastName: _lastNameController.text,
                  birthdate: _selectedBirthDate ?? DateTime.now(),
                  address: [(_selectedAddress ?? AddressModel())],
                ),
              );
              if (user.$2 != null) {
                if (!context.mounted) return;
                ref
                    .read(profileProviderNotifier.notifier)
                    .setUser(user.$2 ?? UserModel.empty());
                NavigationService.goToProfile(context);
              }
            },
            width: double.infinity,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            icon: Icons.arrow_forward,
          ),
        ],
      ),
    );
  }

  @override
  void hideLoader() {
    LoadingModal.hide();
  }

  @override
  void manageError(ErrorModel error) {
    ErrorModal.show(context, error);
  }

  @override
  void showLoader() {
    LoadingModal.show(context);
  }
}
