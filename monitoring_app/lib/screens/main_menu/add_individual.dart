import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_appbars.dart';
import 'package:monitoring_app/components/app_buttons.dart';
import 'package:monitoring_app/components/app_colors.dart';
import 'package:monitoring_app/models/individual_data/data_services.dart';
import 'package:monitoring_app/models/individual_data/individual_data.dart';

class AddIndividualScreen extends StatefulWidget {
  const AddIndividualScreen({super.key});

  @override
  State<AddIndividualScreen> createState() => _AddIndividualScreenState();
}

class _AddIndividualScreenState extends State<AddIndividualScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final IndividualInformation _individualInfo = IndividualInformation();

  final DataServices _dataServices = DataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbaritem('Novo Indivíduo'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Raça'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.emphasys,
                      ),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 18, color: AppColors.secondary),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: AppColors.secondary)),
                  ),
                  validator: (breed) {
                    if (breed!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (breed) => _individualInfo.breed = breed,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Gênero'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.emphasys,
                      ),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 18, color: AppColors.secondary),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: AppColors.secondary)),
                  ),
                  validator: (gender) {
                    if (gender!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (gender) => _individualInfo.gender = gender,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Coloração'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.emphasys,
                      ),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 18, color: AppColors.secondary),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: AppColors.secondary)),
                  ),
                  validator: (color) {
                    if (color!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (color) => _individualInfo.color = color,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: const Text('Peso (Kg)'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.emphasys,
                      ),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 18, color: AppColors.secondary),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: AppColors.secondary)),
                  ),
                  validator: (weight) {
                    if (weight!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (weight) => _individualInfo.weight = weight,
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              bool ok =
                                  await _dataServices.add(_individualInfo);
                              if (ok && mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: AppColors.green,
                                        content: const Text(
                                            'Dados inseridos com sucesso')));
                                _formkey.currentState!.reset();
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: AppColors.red,
                                        content: const Text(
                                            'Problemas ao inserir dados')));
                              }
                            }
                          },
                          style: AppButtons.greenlButtonStyle,
                          child: const Text('Adicionar'),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: AppButtons.redlButtonStyle,
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
