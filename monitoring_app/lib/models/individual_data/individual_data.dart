// classe de dados para envio e recebimento do firebase

import 'package:cloud_firestore/cloud_firestore.dart';

class IndividualInformation {
  String? id; // identificação do animal
  // String? name; // nome do aninmal - opcional
  String? gender; // genero do animal
  String? weight; // peso do animal
  String? breed; // raça
  String? color; // coloração da pelagem

  // construtor
  IndividualInformation(
      {this.id,
      // this.name,
      this.gender,
      this.weight,
      this.breed,
      this.color});

  // metodo de armazenamento dos dados do documento obtido no firebase
  IndividualInformation.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    // name = doc.get('name');
    gender = doc.get('gender');
    weight = doc.get('weight');
    breed = doc.get('breed');
    color = doc.get('color');
  }

  // metodo de envio de dados ao firebase -  converte informaçoes para json
  Map<String, dynamic> toMap() {
    return {
      // 'name': name,
      'gender': gender,
      'weight': weight,
      'breed': breed,
      'color': color,
    };
  }
}
