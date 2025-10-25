import 'package:flutter/material.dart';
import '../molecules/address_card.dart';
import '../atoms/custom_button.dart';
import '../../theme/app_colors.dart';

class AddressModel {
  final String id;
  final String title;
  final String subtitle;

  const AddressModel({
    required this.id,
    required this.title,
    required this.subtitle,
  });
}

class AddressList extends StatelessWidget {
  final String title;
  final List<AddressModel> addresses;
  final VoidCallback? onAddAddress;
  final Function(AddressModel)? onEditAddress;
  final Function(AddressModel)? onDeleteAddress;
  final VoidCallback? onLogout;
  final EdgeInsetsGeometry? padding;

  const AddressList({
    super.key,
    required this.title,
    required this.addresses,
    this.onAddAddress,
    this.onEditAddress,
    this.onDeleteAddress,
    this.onLogout,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // Lista de direcciones
            ...addresses.map((address) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AddressCard(
                    title: address.title,
                    subtitle: address.subtitle,
                    onEdit: onEditAddress != null
                        ? () => onEditAddress!(address)
                        : null,
                    onDelete: onDeleteAddress != null
                        ? () => onDeleteAddress!(address)
                        : null,
                  ),
                )),
            
            const SizedBox(height: 30),
            
            if (onAddAddress != null)
              CustomButton(
                text: 'Agregar dirección',
                icon: Icons.add,
                onPressed: onAddAddress,
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                width: double.infinity,
              ),
            
            if (onAddAddress != null && onLogout != null)
              const SizedBox(height: 16),
            
            // Botón cerrar sesión
            if (onLogout != null)
              CustomButton(
                text: 'Cerrar sesión',
                icon: Icons.logout,
                onPressed: onLogout,
                type: ButtonType.outlined,
                foregroundColor: AppColors.error,
                width: double.infinity,
              ),
          ],
        ),
      ),
    );
  }
}