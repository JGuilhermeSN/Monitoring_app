import 'package:flutter/material.dart';
import 'package:monitoring_app/components/app_colors.dart';

class AppButtons {
  static final loginButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondary,
      textStyle: TextStyle(fontSize: 18, color: AppColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)));

  static final redlButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.red,
      textStyle: TextStyle(fontSize: 18, color: AppColors.red),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)));

  static final greenlButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.green,
    textStyle: TextStyle(fontSize: 18, color: AppColors.green),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  );

  static final auxiliarButtonStyle = TextButton.styleFrom(
    foregroundColor: AppColors.emphasys,
    textStyle: const TextStyle(
      fontSize: 15.5,
    ),
  );

  static final logoutButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: AppColors.red,
    side: BorderSide(color: AppColors.red),
    textStyle: const TextStyle(fontSize: 16),
  );
}
