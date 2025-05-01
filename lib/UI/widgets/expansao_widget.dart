// Representa uma expansão ig: "A1", "A1A", etc...

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/UI/widgets/home_pokecard.dart';
import 'package:tcg_tracker/data/cards_data.dart';

class ExpansaoWidget extends StatefulWidget {
  final String nomeExpansao;

  const ExpansaoWidget({super.key, required this.nomeExpansao});

  @override
  State<ExpansaoWidget> createState() => _ExpansaoWidgetState();
}

class _ExpansaoWidgetState extends State<ExpansaoWidget> {
  late double sizeOfCards;
  late bool switchStatus;
  @override
  void initState() {
    super.initState();
    sizeOfCards = 0.4;
    switchStatus = false; // 3 por linha
  }

  @override
  Widget build(BuildContext context) {
    CardsData cardsData = Provider.of<CardsData>(context);

    List<dynamic> cartasDessaExpansao =
        cardsData.cartasPacote[widget.nomeExpansao.toString()];
    return ExpansionTile(
      title: Text(
        widget.nomeExpansao.toString(),
        style: TextStyle(
          color: AppColors.lightColor,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
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
                      "Adicionar todas do conjunto",
                      style: TextStyle(
                        color: AppColors.lightColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  //to-do
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.grid_3x3, color: AppColors.lightColor),
                  Switch(
                    value: switchStatus,
                    activeColor: AppColors.lightBlue,
                    inactiveTrackColor: Color.alphaBlend(
                      Colors.black.withOpacity(0.5),
                      AppColors.darkColor,
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        switchStatus = !switchStatus;
                      });
                    },
                  ),
                  Icon(Icons.grid_4x4, color: AppColors.lightColor),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1.0,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  MediaQuery.of(context).size.width *
                  sizeOfCards, //muda aqui para mudar a quantidade
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
