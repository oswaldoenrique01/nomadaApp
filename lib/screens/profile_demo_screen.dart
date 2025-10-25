import 'package:flutter/material.dart';
import '../core/widgets/widgets.dart';

class ProfileDemoScreen extends StatelessWidget {
  const ProfileDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = [
      const AddressModel(
        id: '1',
        title: 'Colombia, Santander, Bucaramanga',
        subtitle: 'Cra 12 #45-67',
      ),
      const AddressModel(
        id: '2',
        title: 'Colombia, Cundinamarca, Bogotá',
        subtitle: 'Calle 98 #40-20',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          // Header del perfil
          const ProfileHeader(
            name: 'Mayra Muñoz Arias',
            subtitle: 'Nacida el 10 mayo 1999',
            avatarInitials: 'M',
          ),
          
          // Lista de direcciones
          Expanded(
            child: AddressList(
              title: 'Mis direcciones',
              addresses: addresses,
              onAddAddress: () {
                // Lógica para agregar dirección
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Agregar nueva dirección')),
                );
              },
              onEditAddress: (address) {
                // Lógica para editar dirección
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Editar: ${address.title}')),
                );
              },
              onDeleteAddress: (address) {
                // Lógica para eliminar dirección
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Eliminar: ${address.title}')),
                );
              },
              onLogout: () {
                // Lógica para cerrar sesión
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cerrando sesión...')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}