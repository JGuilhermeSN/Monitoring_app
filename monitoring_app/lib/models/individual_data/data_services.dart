import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:monitoring_app/models/individual_data/individual_data.dart';
// import 'package:monitoring_app/models/users/user.dart';

class DataServices {
  //obtendo instancia do firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference firestoreRef;

  // construtor
  DataServices() {
    firestoreRef = _firestore.collection('IndividualInformation');
  }

  // Metodo de adição ao firebase
  Future<bool> add(IndividualInformation individualInformation) async {
    try {
      await firestoreRef.add(individualInformation.toMap());
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao inserir os dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Inclusão abortada');
      }
      return Future.value(false);
    }
  }

  // metodo de exclusao dos dados cadastrados
  Future<bool> delete(String individualId) async {
    try {
      await firestoreRef.doc(individualId).delete();
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao deletar os dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Deleção abortada');
      }
      return Future.value(false);
    }
  }

  // Nota: adicionar o metodo de alteraçao de dados do crud

}
