import 'package:flutter/material.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Aplicativo cis",
          style: TextStyle(color: AppColors.lightColor),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Center(
        child: Row(
          children: [
            Text(
              "Its working",
              style: TextStyle(color: AppColors.accentColor),
            ),
            
          ],
        ),
      ),
    );
  }
}
