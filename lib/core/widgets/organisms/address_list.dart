import 'package:flutter/material.dart';
import '../../models/address_model.dart';
import '../molecules/address_card.dart';
import '../../theme/app_colors.dart';
import '../../constants/app_sizes.dart';

class AddressList extends StatelessWidget {
  final String title;
  final List<AddressModel> addresses;
  final Function(int)? onEditAddress;
  final Function(int)? onDeleteAddress;
  final EdgeInsetsGeometry? padding;

  const AddressList({
    super.key,
    required this.title,
    required this.addresses,
    this.onEditAddress,
    this.onDeleteAddress,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          const EdgeInsets.only(
            left: AppSizes.paddingMedium,
            right: AppSizes.paddingMedium,
            top: AppSizes.paddingMedium,
          ),
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
          SizedBox(height: AppSizes.paddingMedium,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.spacingMedium),
                  child: AddressCard(
                    title:
                        '${address.country}, ${address.department}, \n${address.municipality}',
                    subtitle: address.municipality,
                    onEdit: onEditAddress != null
                        ? () => onEditAddress!(index)
                        : null,
                    onDelete: addresses.length == 1 ? null : onDeleteAddress != null
                        ? () => onDeleteAddress!(index)
                        : null,
                  ),
                );
              },
              padding: const EdgeInsets.all(0),
              itemCount: addresses.length,
            ),
          ),
        ],
      ),
    );
  }
}
