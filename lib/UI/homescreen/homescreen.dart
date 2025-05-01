import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/UI/widgets/expansao_widget.dart';
import 'package:tcg_tracker/data/cards_data.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardsData cardsData = Provider.of<CardsData>(context);
    final nomesExpansoesDisponiveis = cardsData.cartasPacote.keys.toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        title: Text(
          "TCGP tracker",
          style: TextStyle(color: AppColors.lightColor),
        ),
        backgroundColor: AppColors.mainColor,
      ),

      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(nomesExpansoesDisponiveis.length, (index) {
          return ExpansaoWidget(nomeExpansao: nomesExpansoesDisponiveis[index]);
        }),
      ),
    );
  }
}
