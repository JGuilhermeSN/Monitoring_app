import 'package:flutter/material.dart';
import 'app_colors.dart';

Widget textFormItem(
    String name, String? hintTips, bool obscureBool, String? validType) {
  // final LocalUser localUser = LocalUser();
  // final UserServices userServices = UserServices();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return Form(
    // key: formKey,
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureBool,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(
          fontSize: 16,
          color: AppColors.secondary,
        ),
        hintText: hintTips,
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
          borderSide: BorderSide(color: AppColors.secondary),
        ),
      ),
    ),
  );
}
