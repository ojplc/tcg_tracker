import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tcg_tracker/UI/homescreen/homescreen.dart';
import 'package:tcg_tracker/data/cards_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //garante que a parte asincrona sera carregada antes
  //de iniciar a aplicação

  await Hive.initFlutter();
  // "set-number"
  var pokecardBox = await Hive.openBox("pokecardBox");

  CardsData cardsData = CardsData();
  await cardsData.getCartas();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return cardsData;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homescreen());
  }
}
