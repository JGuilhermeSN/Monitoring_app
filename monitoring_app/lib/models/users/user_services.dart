import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monitoring_app/models/users/user.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference userFirestoreRef;
  // metodo get para obter referencia da coleçao de users
  DocumentReference get firestoreRef =>
      _firestore.doc('users/${localUser!.id}');

  // metodo construtor utilizado de referencia para a coleçao user no firebase
  UserServices() {
    userFirestoreRef = _firestore.collection('users');
  }
  // variavel de instancia do usuario local
  LocalUser? localUser;

  late bool loading;

  Future<void> signUp(LocalUser localUser) async {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: localUser.email!, password: localUser.password!))
        .user;
    localUser.id = user!.uid;
    this.localUser = localUser;
    saveData();
  }

  // Metodo de login usando firebase exceptions
  Future<bool> signIn(LocalUser localUser) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
        email: localUser.email!,
        password: localUser.password!,
      ))
          .user;
      localUser.id = user!.uid;
      this.localUser = localUser;
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
      return Future.value(false);
    }
  }

  Future<void> saveData() async {
    await firestoreRef.set(localUser!.toMap());
  }
}
