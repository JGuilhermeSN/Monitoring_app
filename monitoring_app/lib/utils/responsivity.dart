import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  // Métodos para verificar o tamanho de cada dispositivo
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 770;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 770;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 770) {
          return desktop;
        } else if (constraints.maxHeight >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
