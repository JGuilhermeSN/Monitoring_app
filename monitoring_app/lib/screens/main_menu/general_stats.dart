import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_appbars.dart';

class GeneralStatistics extends StatelessWidget {
  const GeneralStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbaritem('Monitoramento de Gado'),
      body: const Center(
        child: Text("grafico geral"),
      ),
    );
  }
}
