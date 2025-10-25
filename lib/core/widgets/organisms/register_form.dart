import 'package:flutter/material.dart';
import '../atoms/custom_avatar.dart';
import '../atoms/custom_text_field.dart';
import '../atoms/custom_date_picker.dart';
import '../atoms/custom_button.dart';
import '../../constants/app_sizes.dart';
import '../../theme/app_colors.dart';
import '../../utils/date_utils.dart' as date_utils;

class RegisterForm extends StatefulWidget {
  final Function(String firstName, String lastName, DateTime? birthDate)? onNext;
  final Function()? onAvatarTap;
  final String? avatarUrl;
  final String? initialFirstName;
  final String? initialLastName;
  final DateTime? initialBirthDate;

  const RegisterForm({
    super.key,
    this.onNext,
    this.onAvatarTap,
    this.avatarUrl,
    this.initialFirstName,
    this.initialLastName,
    this.initialBirthDate,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  DateTime? _selectedBirthDate;
  bool _isLoading = false;
  String? _birthDateError;

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.initialFirstName ?? '';
    _lastNameController.text = widget.initialLastName ?? '';
    _selectedBirthDate = widget.initialBirthDate;
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

  void _onBirthDateSelected(DateTime date) {
    setState(() {
      _selectedBirthDate = date;
      _birthDateError = null;
    });
  }

  void _handleNext() {
    final isFormValid = _formKey.currentState?.validate() ?? false;
    final isBirthDateValid = _validateBirthDate();

    if (isFormValid && isBirthDateValid) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          
          widget.onNext?.call(
            _firstNameController.text.trim(),
            _lastNameController.text.trim(),
            _selectedBirthDate,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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

          CustomDatePicker(
            labelText: 'Fecha de nacimiento',
            hintText: 'Selecciona tu fecha de nacimiento',
            selectedDate: _selectedBirthDate,
            onDateSelected: _onBirthDateSelected,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            errorText: _birthDateError,
          ),
          SizedBox(height: AppSizes.size6),
          
          CustomButton(
            text: 'Siguiente',
            onPressed: _isLoading ? null : _handleNext,
            isLoading: _isLoading,
            width: double.infinity,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            icon: Icons.arrow_forward,
          ),
        ],
      ),
    );
  }
}