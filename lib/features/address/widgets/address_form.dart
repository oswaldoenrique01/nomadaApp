import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadaapp/core/models/address_model.dart';
import 'package:nomadaapp/features/register/screens/provider/register_provider.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/atoms/custom_button.dart';
import '../../../core/widgets/atoms/custom_card.dart';
import '../../../core/widgets/atoms/custom_text_field.dart';

class AddressForm extends StatefulWidget {
  final AddressModel? addressModel;
  final bool isEdit;

  const AddressForm({
    super.key,
    required this.addressModel,
    this.isEdit = false,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _countryController = TextEditingController();
  final _departmentController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    initForm();
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _countryController.dispose();
    _departmentController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  initForm() {
    final address = widget.addressModel;
    if (address != null) {
      _addressController.text = address.address;
      _countryController.text = address.country;
      _departmentController.text = address.department;
      _cityController.text = address.municipality;
    }
  }

  String? _validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La dirección es requerida';
    }
    if (value.trim().length < 5) {
      return 'La dirección debe tener al menos 5 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información de Dirección',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: AppSizes.size6),

            CustomTextField(
              controller: _countryController,
              labelText: 'Paìs',
              hintText: 'Colombia',
              validator: _validateAddress,
              maxLines: 2,
            ),

            SizedBox(height: AppSizes.size3),

            CustomTextField(
              controller: _departmentController,
              labelText: 'Departamento',
              hintText: 'Atlántico',
              validator: _validateAddress,
              maxLines: 2,
            ),

            SizedBox(height: AppSizes.size3),

            CustomTextField(
              controller: _cityController,
              labelText: 'Municipio',
              hintText: 'Barranquila',
              validator: _validateAddress,
              maxLines: 2,
            ),

            SizedBox(height: AppSizes.size3),

            CustomTextField(
              controller: _addressController,
              labelText: 'Dirección',
              hintText: 'Ej: Calle 123 #45-67, Apto 101',
              validator: _validateAddress,
              maxLines: 2,
            ),

            SizedBox(height: AppSizes.size8),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Cancelar',
                    onPressed: () => Navigator.pop(context),
                    type: ButtonType.outlined,
                    foregroundColor: AppColors.textSecondary,
                  ),
                ),
                SizedBox(width: AppSizes.size2),
                Expanded(
                  child: CustomButton(
                    text: 'Guardar',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      final address = AddressModel(
                        address: _addressController.text,
                        country: _countryController.text,
                        department: _departmentController.text,
                        municipality: _cityController.text,
                      );

                      context.pop(address);
                    },
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
