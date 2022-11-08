import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_colors.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        title: Text(
          'Perfil',
          style: TextStyle(color: AppColors.primary, fontSize: 18),
        ),
      ),
      body: const Center(
        child: Text("perfil de usuario"),
      ),
    );
  }
}
