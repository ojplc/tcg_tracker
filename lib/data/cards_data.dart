import 'dart:convert'; //biblioteca para usar json.decode

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tcg_tracker/model/pokecard.dart';

class CardsData extends ChangeNotifier {
  //Lista com todas as cartas
  List<Pokecard> cartas = [];

  //separa as cartas por set
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

    await startHiveBox();
  }

  Future<void> startHiveBox() async {
    final _pokecardBox = Hive.box("pokecardBox");
    var lastPokecard = cartas.last;
    if (_pokecardBox.get("${lastPokecard.set}-${lastPokecard.number}") ==
        null) {
      for (var carta in cartas) {
        var key = "${carta.set}-${carta.number}";
        if (_pokecardBox.get(key) == null) {
          _pokecardBox.put(key, false);
        }
      }
    }
  }
}
