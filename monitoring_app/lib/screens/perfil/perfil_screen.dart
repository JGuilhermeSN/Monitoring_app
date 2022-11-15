import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_buttons.dart';
import 'package:monitoring_app/components/app_colors.dart';
import 'package:monitoring_app/models/users/user.dart';
import 'package:monitoring_app/models/users/user_services.dart';
import 'package:monitoring_app/screens/login_pages/signin_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

/*
  tela ainda nao esta funcionado como deveria, adicionar o esquema de retornar usuario logado para mostrar as informaçoes corretas
*/
class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    UserServices userServices = UserServices();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        title: Text(
          'Perfil',
          style: TextStyle(color: AppColors.primary, fontSize: 18),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          shadowColor: AppColors.secondary,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .65,
            width: MediaQuery.of(context).size.width * .75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://imagensemoldes.com.br/wp-content/uploads/2021/05/Ilustracao-Bart-Simpson-PNG-570x1024.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                      stream: userServices.userFirestoreRef.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: Text('Dados indisponiveis'));
                        }
                        return Builder(
                          builder: (context) {
                            DocumentSnapshot docSnaphot =
                                snapshot.data!.docs.first;
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: .5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: SizedBox(
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Nome: \t',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            docSnaphot['name'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: .5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: SizedBox(
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Email: \t',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            docSnaphot['email'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      style: AppButtons.logoutButtonStyle,
                      onPressed: () {
                        userServices.logout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SigninScreen()));
                      },
                      child: const Text('Sair')),
                  const SizedBox(height: 30),
                  const Text(
                    'by José Guilherme',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
