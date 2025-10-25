import 'package:flutter/material.dart';
import 'package:nomadaapp/features/register/screens/register_form.dart';
import '../../../core/widgets/widgets.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Registro'),
        elevation: AppSizes.elevation1,
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
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),

              SizedBox(height: AppSizes.size6),

              CustomCard(
                padding: const EdgeInsets.all(AppSizes.paddingL),
                borderRadius: BorderRadius.circular(AppSizes.radiusL),
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
