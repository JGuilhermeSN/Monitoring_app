import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_appbars.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: appbaritem('Novidades'),
      body: const Center(
        child: Text(
          "hello",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
