import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/UI/widgets/home_pokecard.dart';
import 'package:tcg_tracker/data/cards_data.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardsData cardsData = Provider.of<CardsData>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        title: Text(
          "TCGP tracker",
          style: TextStyle(color: AppColors.lightColor),
        ),
        backgroundColor: AppColors.mainColor,
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1.0,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                MediaQuery.of(context).size.width *
                0.4, //muda aqui para mudar a quantidade
            //de elementos por fileira
            childAspectRatio: 0.6,
          ),
          itemCount: cardsData.cartas.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: HomePokecard(pokecard: cardsData.cartas[index]),
            );
          },
        ),
      ),
    );
  }
}
