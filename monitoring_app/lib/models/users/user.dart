import 'package:cloud_firestore/cloud_firestore.dart';

class LocalUser {
  String? id;
  String? name;
  String? email;
  String? socialMedia;
  String? password;
  String? confirmPassword;

  LocalUser({
    this.id,
    this.name,
    this.email,
    this.socialMedia,
    this.password,
    this.confirmPassword,
  });
// metodo pára armazanar dados do documento obtido no firebase, no firestore database
  LocalUser.fromDocument(DocumentSnapshot doc) {
    id = doc.get('id') as String;
    name = doc.get('name') as String;
    email = doc.get('email') as String;
    // socialMedia = doc.get('socialMedia') as String; // provisoriamente inativo
  }
// metodo utilizado para converter as informaçoes para formato json,
// que é reconhecido pelo firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      // 'socialMedia': socialMedia, // Provisoriamente inativo
    };
  }
}
