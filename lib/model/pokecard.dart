class Pokecard {
  String set;
  int number;
  String rarity;
  String imageSource;
  String name;

  // Construtor
  Pokecard({
    required this.set,
    required this.number,
    required this.rarity,
    required this.imageSource,
    required this.name,
  });

  // Salvar dados em Json
  Map<String, dynamic> toMap() {
    return {
      "set": set,
      "number": number,
      "rarity": rarity,
      "imageSource": imageSource,
      "name": name,
    };
  }

  factory Pokecard.fromMap(Map<String, dynamic> map) {
    return Pokecard(
      imageSource:
          "https://assets.pokemon-zone.com/game-assets/CardPreviews/${map["imageName"]}",
      name: map["label"]["eng"],
      number: map["number"],
      rarity: map["rarityCode"],
      set: map["set"],
    );
  }

  @override
  String toString() {
    return 'Pokecard{name: $name, set: $set, number: $number, rarity: $rarity, imageSource: $imageSource}';
  }
}
