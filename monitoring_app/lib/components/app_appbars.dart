import 'package:flutter/material.dart';
import 'app_colors.dart';

PreferredSizeWidget appbaritem(String barname) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.secondary,
    title: Text(barname),
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: AppColors.primary,
    ),
  );
}
