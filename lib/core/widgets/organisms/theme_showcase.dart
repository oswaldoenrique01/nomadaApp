import 'package:flutter/material.dart';
import '../atoms/custom_card.dart';
import '../molecules/text_style_showcase.dart';
import '../molecules/color_palette_section.dart';
import '../molecules/gradient_showcase.dart';
import '../../constants/app_sizes.dart';
import '../../theme/app_colors.dart';

class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyleShowcase(
            title: 'Títulos y Encabezados',
            textStyles: [
              TextStyleData(
                textStyle: Theme.of(context).textTheme.displayLarge!,
                label: 'Display Large',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.displayMedium!,
                label: 'Display Medium',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.displaySmall!,
                label: 'Display Small',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.headlineLarge!,
                label: 'Headline Large',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.headlineMedium!,
                label: 'Headline Medium',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.headlineSmall!,
                label: 'Headline Small',
              ),
            ],
          ),
          
          SizedBox(height: AppSizes.size2),
          
          TextStyleShowcase(
            title: 'Títulos de Sección',
            textStyles: [
              TextStyleData(
                textStyle: Theme.of(context).textTheme.titleLarge!,
                label: 'Title Large',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.titleMedium!,
                label: 'Title Medium',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.titleSmall!,
                label: 'Title Small',
              ),
            ],
          ),
          
          SizedBox(height: AppSizes.size2),
          
          TextStyleShowcase(
            title: 'Texto del Cuerpo',
            textStyles: [
              TextStyleData(
                textStyle: Theme.of(context).textTheme.bodyLarge!,
                label: 'Body Large - Texto principal y contenido importante.',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.bodyMedium!,
                label: 'Body Medium - Contenido secundario y descripciones.',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.bodySmall!,
                label: 'Body Small - Notas y texto auxiliar.',
              ),
            ],
          ),
          
          SizedBox(height: AppSizes.size2),
          
          TextStyleShowcase(
            title: 'Etiquetas y Labels',
            textStyles: [
              TextStyleData(
                textStyle: Theme.of(context).textTheme.labelLarge!,
                label: 'Label Large',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.labelMedium!,
                label: 'Label Medium',
              ),
              TextStyleData(
                textStyle: Theme.of(context).textTheme.labelSmall!,
                label: 'Label Small',
              ),
            ],
          ),
          
          SizedBox(height: AppSizes.size2),
          
          CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Botones',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: AppSizes.size2),
                Wrap(
                  spacing: AppSizes.size1,
                  runSpacing: AppSizes.size1,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Elevated Button'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Outlined Button'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Text Button'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('Filled Button'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          SizedBox(height: AppSizes.size2),
          
          GradientShowcase(
            title: 'Gradientes',
            gradients: [
              GradientData(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryVariant],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                label: 'Gradiente Primario',
              ),
              GradientData(
                gradient: const LinearGradient(
                  colors: [AppColors.secondary, AppColors.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                label: 'Gradiente Secundario',
              ),
            ],
          ),
          
          SizedBox(height: AppSizes.size2),
          
          ColorPaletteSection(
            title: 'Paleta de Colores',
            colors: [
              ColorData(
                color: Theme.of(context).colorScheme.primary,
                label: 'Primary',
              ),
              ColorData(
                color: Theme.of(context).colorScheme.secondary,
                label: 'Secondary',
              ),
              const ColorData(
                color: AppColors.accent,
                label: 'Accent',
              ),
              const ColorData(
                color: AppColors.accentLight,
                label: 'Accent Light',
              ),
              ColorData(
                color: Theme.of(context).colorScheme.surface,
                label: 'Surface',
              ),
              ColorData(
                color: Theme.of(context).colorScheme.background,
                label: 'Background',
              ),
              const ColorData(
                color: AppColors.success,
                label: 'Success',
              ),
              const ColorData(
                color: AppColors.warning,
                label: 'Warning',
              ),
              ColorData(
                color: Theme.of(context).colorScheme.error,
                label: 'Error',
              ),
            ],
          ),
        ],
      ),
    );
  }
}