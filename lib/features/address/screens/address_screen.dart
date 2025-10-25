import 'package:flutter/material.dart';
import '../../../core/models/address_model.dart';
import '../../../core/widgets/widgets.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/address_form.dart';

class AddAddressScreen extends StatelessWidget {
  final AddressModel? addressModel;
  final bool isEdit;

  const AddAddressScreen({
    super.key,
    required this.addressModel,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(isEdit ? 'Editar Dirección' : 'Agregar Dirección'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nueva Dirección',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: AppSizes.size2),

              Text(
                'Completa la información de tu dirección para continuar',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),

              SizedBox(height: AppSizes.size6),

              AddressForm(addressModel: addressModel),

              SizedBox(height: AppSizes.size6),

              CustomCard(
                backgroundColor: AppColors.accentLight.withAlpha(77),
                border: Border.all(
                  color: AppColors.accent.withAlpha(128),
                  width: 1,
                ),
                boxShadow: const [],
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.primary,
                      size: AppSizes.iconMedium,
                    ),
                    SizedBox(width: AppSizes.size2),
                    Expanded(
                      child: Text(
                        'Esta dirección se guardará en tu perfil y podrás usarla para entregas y servicios.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
