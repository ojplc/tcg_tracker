import 'dart:convert'; //biblioteca para usar json.decode

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class CardsData extends ChangeNotifier {
  List<Pokecard> cartas = [];

  Future<void> getCartas() async {
    String jsonString = await rootBundle.loadString("assets/cards.json");
    List<dynamic> data = json.decode(jsonString); //json começa com []

    for (var dadosCartas in data) {
      cartas.add(Pokecard.fromMap(dadosCartas));
    }
  }
}
