// Representa um widget de uma carta individual

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class HomePokecard extends StatefulWidget {
  final Pokecard pokecard;
  const HomePokecard({super.key, required this.pokecard});

  @override
  State<HomePokecard> createState() => _HomePokecardState();
}

class _HomePokecardState extends State<HomePokecard> {
  bool isGreyscale = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: CachedNetworkImage(
            imageUrl: widget.pokecard.imageSource,
            errorWidget: (context, url, error) => Icon(Icons.error),
            color: isGreyscale ? Colors.grey : null,
            colorBlendMode: isGreyscale ? BlendMode.saturation : null,
          ),
          onTap: () {
            setState(() {
              isGreyscale = !isGreyscale;
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
