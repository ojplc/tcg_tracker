// Representa uma expansão ig: "A1", "A1A", etc...

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/UI/widgets/home_pokecard.dart';
import 'package:tcg_tracker/data/cards_data.dart';

class ExpansaoWidget extends StatelessWidget {
  final String nomeExpansao;

  const ExpansaoWidget({super.key, required this.nomeExpansao});

  @override
  Widget build(BuildContext context) {
    CardsData cardsData = Provider.of<CardsData>(context);

    List<dynamic> cartasDessaExpansao =
        cardsData.cartasPacote[nomeExpansao.toString()];
    return ExpansionTile(
      title: Text(
        nomeExpansao.toString(),
        style: TextStyle(color: AppColors.lightColor, fontSize: 20),
      ),
      children: [
        InkWell(
          highlightColor: AppColors.mainColor,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20.0),
            right: Radius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20.0,
              child: Text(
                "Adicionar todas as cartas do conjunto",
                style: TextStyle(color: AppColors.lightColor),
              ),
            ),
          ),
          onTap: () {
            //to-do
          },
        ),
        SizedBox(height: 20.0),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1.0,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  MediaQuery.of(context).size.width *
                  0.4, //muda aqui para mudar a quantidade
              //de elementos por fileira
              childAspectRatio: 0.6,
            ),
            itemCount: cartasDessaExpansao.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 2.0,
                ),
                child: HomePokecard(pokecard: cartasDessaExpansao[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
