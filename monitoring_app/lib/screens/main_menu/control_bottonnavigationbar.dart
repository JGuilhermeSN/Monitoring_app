import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_colors.dart';
import 'package:monitoring_app/screens/main_menu/general_stats.dart';
import 'package:monitoring_app/screens/main_menu/homepage_screen.dart';
import 'package:monitoring_app/screens/main_menu/individual_stats.dart';
import 'package:monitoring_app/screens/perfil/perfil_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<Homepage> {
  List<Widget> pageList = []; // lista de paginas
  int _currentIndex = 0; // variavel que determina a pagina inicial
  @override
  void initState() {
    _currentIndex = 0;
    // adição da homepage - outras paginas do bottonnavigation
    pageList.add(const HomepageScreen());
    pageList.add(const GeneralStatistics());
    pageList.add(const IndividuaStatistics());
    pageList.add(const PerfilScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.secondary,
        selectedItemColor: AppColors.emphasys,
        unselectedItemColor: AppColors.primaryAuxiliary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_rounded), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Balanço"),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: "Individuos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Perfil"), // perfil
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
