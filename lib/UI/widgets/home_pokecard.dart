// Representa um widget de uma carta individual

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class HomePokecard extends StatefulWidget {
  final Pokecard pokecard;
  const HomePokecard({super.key, required this.pokecard});

  @override
  State<HomePokecard> createState() => _HomePokecardState();
}

class _HomePokecardState extends State<HomePokecard> {
  late bool isColorful; // late avisa que a variavel sera inicializada depois
  final _pokecardBox = Hive.box("pokecardBox");

  @override
  void initState() {
    super.initState();
    isColorful = _pokecardBox.get(
      "${widget.pokecard.set}-${widget.pokecard.number}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: CachedNetworkImage(
            imageUrl: widget.pokecard.imageSource,
            errorWidget: (context, url, error) => Icon(Icons.error),
            color: !isColorful ? Colors.grey : null,
            colorBlendMode: !isColorful ? BlendMode.saturation : null,
          ),
          onTap: () {
            setState(() {
              isColorful = !isColorful;
              _pokecardBox.put(
                "${widget.pokecard.set}-${widget.pokecard.number}",
                isColorful,
              );
            });
          },
        ),
        Text(
          widget.pokecard.name,
          style: TextStyle(
            color: AppColors.lightColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
