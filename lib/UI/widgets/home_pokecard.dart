import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tcg_tracker/UI/core/app_colors.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class HomePokecard extends StatelessWidget {
  final Pokecard pokecard;
  const HomePokecard({super.key, required this.pokecard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: pokecard.imageSource,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(
          pokecard.name,
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
