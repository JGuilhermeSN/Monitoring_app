import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monitoring_app/screens/login_pages/signin_screen.dart';
import 'package:monitoring_app/screens/login_pages/signup_screen.dart';
import 'package:monitoring_app/screens/main_menu/add_individual.dart';
import 'package:monitoring_app/screens/main_menu/control_bottonnavigationbar.dart';
import 'package:monitoring_app/screens/main_menu/general_stats.dart';
import 'package:monitoring_app/screens/main_menu/individual_stats.dart';
import 'package:monitoring_app/screens/perfil/perfil_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/Signin', // <--- Rota de pagina inicial - login
      routes: {
        //Rotas das paginas da aplicação
        '/Signin': (context) => const SigninScreen(),
        '/Signup': (context) => const SignupScreen(),
        '/Homepage': (context) => const Homepage(),
        '/HomepageScreen': (context) => const Homepage(),
        '/GeneralStats': (context) => const GeneralStatistics(),
        '/IndividualStats': (context) => const IndividuaStatistics(),
        '/PerfilScreen': (context) => const PerfilScreen(),
        '/AddIndividualScreen': (context) => const AddIndividualScreen()
      },
    );
  }
}
