import 'package:flutter/material.dart';

enum CategoryType { itallian, dessert, asian }

class Recipe {
  String name;
  String image;
  String guide;
  String video;
  String audio;

  CategoryType categoryType;

  Recipe({
    required this.name,
    required this.image,
    required this.categoryType,
    required this.guide,
    required this.video,
    required this.audio,
  }) {
    this.name = name;
    this.image = image;
    this.guide = guide;
    this.categoryType = categoryType;
    this.video = video;
    this.audio = audio;
  }
}

List<Recipe> recipes = [
  Recipe(
      name: 'tiramisu',
      image: 'assets/images/tiramisu.jpg',
      guide:
          '''Splits de eieren. Meng de dooiers met de mascarpone en de fijne suiker. Klop het eiwit stijf samen met de vanillesuiker. Spatel het door de mascarpone.

        Meng de koffie met de amaretto. Dompel er de helft van de koekjes in en schik ze in een schaal. Bestrijk met de helft van de mascarponecrème en bestrooi met cacaopoeder.
        
        Leg daarop de rest van de koekjes en bestrijk met de rest van de crème. Eindig met cacaopoeder en poedersuiker. Zet 1 nacht in de koelkast.''',
      categoryType: CategoryType.dessert,
      video: 'assets/video/tiramisu.mp4',
      audio: 'audio/tiramisu.mp3'),
  Recipe(
    name: 'spaghetti',
    image: 'assets/images/Spaghetti.jpg',
    guide: '''Snipper de ui en knoflook fijn.

Was en snijd de paprika’s in blokjes. Rasp de wortels en snijd ze ook in fijne stukjes.

Fruit de ui en knoflook glazig in een klontje boter. Voeg daarna de groenten toe en laat ze meestoven.

Kruid alles met peper en zout.

Voeg de gezeefde tomaten toe.

Laat het geheel op een laag vuur stoven tot de groenten beetgaar zijn.

Verhit de boter in een braadpan en bak het gehakt mooi bruin op een matig vuur.

Voeg de saus bij het gehakt.

Kook de pasta al dente in gezouten water.

Dien de pasta op met de saus en werk af met geraspte kaas.''',
    categoryType: CategoryType.itallian,
    video: 'none',
    audio: 'none',
  ),
];
