import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_appbars.dart';

class GeneralStatistics extends StatelessWidget {
  const GeneralStatistics({Key? key}) : super(key: key);

/*
  objetivo inicial da tela: mostrar um grafico que ira comparar os valores de peso de cada animal
  talvez colocar um sistema de organizaçao por raça ou por genero, 
  inicialmente o grafico ira pegar os dados do firebase: peso, raça, genero
  
  coisas a pensar: como fazer o grafico e melhor jeito de montar o layout de exibiçao dos dados
  talvez um ou dois graficos compando macho e femea ou raças diferentes
*/
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
