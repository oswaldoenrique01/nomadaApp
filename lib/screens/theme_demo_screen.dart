import 'package:flutter/material.dart';
import '../core/widgets/widgets.dart';

class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Temas'),
      ),
      body: const ThemeShowcase(),
    );
  }
}