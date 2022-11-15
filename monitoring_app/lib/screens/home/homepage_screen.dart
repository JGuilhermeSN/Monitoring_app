import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_appbars.dart';
import 'package:monitoring_app/components/app_colors.dart';
import 'package:monitoring_app/models/individual_data/data_services.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);
/*
  --lembrete:
  objetivo da tela: mostrar os valores do arroba e talvez do dolar
  pegar esses valores e printar uma lista dos individuos conforme cotaçao x peso
  organizar do maior para menor
  há pensar: como melhorar o layout de amostragem dos dados 
*/
  @override
  Widget build(BuildContext context) {
    DataServices dataServices = DataServices();
    return Scaffold(
      appBar: appbaritem('Valores'),
      body: StreamBuilder(
          stream: dataServices.firestoreRef.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(docSnapshot['weight'],
                                style: TextStyle(
                                    fontSize: 16.5, color: AppColors.emphasys)),
                          ],
                        ),
                      ),
                    );
                  }));
            }
            return const Center(child: Text('Dados indisponiveis'));
          }),
    );
  }
}
