import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monitoring_app/components/app_buttons.dart';
import 'package:monitoring_app/models/users/user.dart';
import 'package:monitoring_app/models/users/user_services.dart';
import '../../components/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final LocalUser _localUser = LocalUser();
  final UserServices _userServices = UserServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              SvgPicture.asset(
                'assets/images/crocodile_animal.svg',
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
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Cadastro',
                          style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        // ------------------------------------------- name formfield
                        TextFormField(
                          obscureText: false,
                          enabled: true,
                          validator: (name) {
                            if (name!.isEmpty) {
                              return 'o Campo deve ser preenchido';
                            } else if (name.trim().split(' ').length <= 1) {
                              return 'Preencha com nome completo';
                            }
                            return null;
                          },
                          onSaved: (name) => _localUser.name = name,
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondary,
                            ),
                            hintText: 'Nome completo',
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
                        const SizedBox(height: 15),
                        // -------------------------------------------email formfield
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
                        const SizedBox(height: 15),
                        // -------------------------------------------password formfield
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
                        const SizedBox(height: 15),
                        // -------------------------------------------confirm password formfield
                        TextFormField(
                          // keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          enabled: true,
                          validator: (confirmPassword) {
                            if (confirmPassword!.isEmpty) {
                              return 'o Campo deve ser preenchido';
                            }
                            return null;
                          },
                          onSaved: (confirmPassword) =>
                              _localUser.confirmPassword = confirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirme a senha',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondary,
                            ),
                            hintText: 'Repita a senha',
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
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  style: AppButtons.loginButtonStyle,
                                  onPressed: register,
                                  child: const Text("Cadastrar-se"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            style: AppButtons.auxiliarButtonStyle,
                            onPressed: entrarMenu,
                            child: const Text("Voltar"))
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

// Função de registro de usuario, botão cadastrar
  register() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (_localUser.password != _localUser.confirmPassword) {
        const ScaffoldMessenger(
          child: Text('As senhas devem ser iguais'),
        );
      }
      _userServices.signUp(_localUser);
      Navigator.of(context).pop();
    }
  }

  // Função de navegação de telas, botão voltar
  entrarMenu() {
    Navigator.of(context).pop();
  }
}
