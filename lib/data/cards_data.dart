import 'dart:convert'; //biblioteca para usar json.decode

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class CardsData extends ChangeNotifier {
  List<Pokecard> cartas = [];

  Map<String, dynamic> cartasPacote = {};

  Future<void> getPacotes() async {
    String jsonStringPacote = await rootBundle.loadString("assets/sets.json");
    List<dynamic> dataPacote = json.decode(jsonStringPacote);

    for (var pacoteInfo in dataPacote) {
      cartasPacote[pacoteInfo["code"]] = [];
    }
  }

  Future<void> getCartas() async {
    String jsonStringCartas = await rootBundle.loadString("assets/cards.json");
    List<dynamic> data = json.decode(jsonStringCartas); //json começa com []

    await getPacotes();

    for (var dadosCartas in data) {
      Pokecard cartaAtual = Pokecard.fromMap(dadosCartas);
      cartas.add(cartaAtual);

      cartasPacote[cartaAtual.set].add(cartaAtual);
    }
  }
}
