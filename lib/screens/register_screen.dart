import 'package:flutter/material.dart';
import '../core/widgets/widgets.dart';
import '../core/constants/app_sizes.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/date_utils.dart' as date_utils;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _avatarUrl;

  void _handleAvatarTap() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Seleccionar foto'),
        content: const Text('Aquí podrías seleccionar una foto de la galería o tomar una nueva.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Simular selección de imagen
              setState(() {
                _avatarUrl = 'https://via.placeholder.com/160';
              });
              Navigator.pop(context);
            },
            child: const Text('Seleccionar'),
          ),
        ],
      ),
    );
  }

  void _handleNext(String firstName, String lastName, DateTime? birthDate) {
    String birthDateText = '';
    if (birthDate != null) {
      final age = date_utils.DateUtils.calculateAge(birthDate);
      final formattedDate = date_utils.DateUtils.formatDateLong(birthDate);
      birthDateText = ' ($age años, nacido el $formattedDate)';
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('¡Hola $firstName $lastName$birthDateText! Continuando al siguiente paso...'),
        backgroundColor: AppColors.success,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Registro'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Bienvenido!',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: AppSizes.size2),
              
              Text(
                'Completa tu perfil para comenzar tu experiencia nómada',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              
              SizedBox(height: AppSizes.size6),
              
              CustomCard(
                padding: const EdgeInsets.all(AppSizes.paddingL),
                borderRadius: BorderRadius.circular(AppSizes.radiusL),
                child: RegisterForm(
                  avatarUrl: _avatarUrl,
                  onAvatarTap: _handleAvatarTap,
                  onNext: _handleNext,
                ),
              ),
              
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
                        'Tu información está segura y solo será utilizada para personalizar tu experiencia.',
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