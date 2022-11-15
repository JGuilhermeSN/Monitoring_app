import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_buttons.dart';
import 'package:monitoring_app/components/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monitoring_app/screens/home/control_bottonnavigationbar.dart';
import 'package:monitoring_app/models/users/user.dart';
import 'package:monitoring_app/models/users/user_services.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SignInState();
}

class _SignInState extends State<SigninScreen> {
  final LocalUser _localUser = LocalUser();
  final UserServices _userServices = UserServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        // reverse: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              SvgPicture.asset(
                'assets/images/crocodile_animal.svg',
                // height: 125,
                height: MediaQuery.of(context).size.height * .15,
                color: AppColors.emphasys,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * .70,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 25),
                        // ---------------------------------------------------------- email formField
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          enabled: true,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'o Campo deve ser preenchido';
                            }
                            return null;
                          },
                          onSaved: (email) => _localUser.email = email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondary,
                            ),
                            hintText: 'example@gmail.com',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: AppColors.emphasys,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(left: 25.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide:
                                  BorderSide(color: AppColors.secondary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // ------------------------------------------------------- password formField
                        TextFormField(
                          obscureText: true,
                          enabled: true,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'o Campo deve ser preenchido';
                            } else if (password.length < 6) {
                              return 'A senha deve ter ao menos 6 caracteres';
                            }
                            return null;
                          },
                          onSaved: (password) => _localUser.password = password,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondary,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: AppColors.emphasys,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(left: 25.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide:
                                  BorderSide(color: AppColors.secondary),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                style: AppButtons.auxiliarButtonStyle,
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/Homepage');
                                },
                                child:
                                    const Text('Teste - Esqueci minha senha')),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                // ----------------------------------------- Botão Login
                                child: ElevatedButton(
                                  style: AppButtons.loginButtonStyle,
                                  onPressed: login,
                                  child: const Text("Entrar"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        TextButton(
                          style: AppButtons.auxiliarButtonStyle,
                          onPressed: registerPage,
                          child: const Text(
                              "Ainda não tem conta? Cadastre-se agora"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool ok = await _userServices.signIn(_localUser);
      if (ok == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ),
        );
      }
    }
  }

  registerPage() {
    Navigator.of(context).pushNamed('/Signup');
  }
}
