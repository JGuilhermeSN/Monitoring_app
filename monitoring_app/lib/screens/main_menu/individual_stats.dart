// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_appbars.dart';
import 'package:monitoring_app/components/app_colors.dart';
import 'package:monitoring_app/models/individual_data/data_services.dart';

class IndividuaStatistics extends StatelessWidget {
  const IndividuaStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataServices _dataServices = DataServices();
    return Scaffold(
      appBar: appbaritem('Monitoramento Individual'),
      backgroundColor: AppColors.primary, // body background color
      body: StreamBuilder(
        stream: _dataServices.firestoreRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // verificação de existencia de dados
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Card(
                    color: AppColors.secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .63,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text(
                                        'Gênero: \t',
                                        style: TextStyle(
                                            color: AppColors.primaryAuxiliary,
                                            fontSize: 16),
                                      ),
                                      // printa os dados presentes no campo especificado do banco de dados
                                      Text(docSnapshot['gender'],
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              color: AppColors.primary))
                                    ]),
                                    Row(children: [
                                      Text(
                                        'Raça: \t',
                                        style: TextStyle(
                                            color: AppColors.primaryAuxiliary,
                                            fontSize: 16),
                                      ),
                                      Text(docSnapshot['breed'],
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              color: AppColors.primary))
                                    ]),
                                    Row(children: [
                                      Text(
                                        'Peso (Kg): \t',
                                        style: TextStyle(
                                            color: AppColors.primaryAuxiliary,
                                            fontSize: 16),
                                      ),
                                      Text(docSnapshot['weight'],
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              color: AppColors.primary)),
                                    ]),
                                    Row(children: [
                                      Text(
                                        'Coloração: \t',
                                        style: TextStyle(
                                            color: AppColors.primaryAuxiliary,
                                            fontSize: 16),
                                      ),
                                      Text(docSnapshot['color'],
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              color: AppColors.primary)),
                                    ]),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: AppColors.primary,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  bool ok = await _dataServices
                                      .delete(docSnapshot.id);
                                  if (ok) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Indivíduo deletado com sucesso'),
                                      ),
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return const Center(child: Text('Dados indisponiveis'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/AddIndividualScreen');
        },
        backgroundColor: AppColors.emphasys,
        child: Icon(
          Icons.add_outlined,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
