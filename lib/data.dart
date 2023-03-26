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
  Recipe(
      name: 'noedels',
      image: 'assets/images/noodles.jpg',
      guide:
          '''Kook de noedels volgens de aanwijzingen op de verpakking. Giet af en bewaar ze in een kom met koud water.

        Maak de groenten schoon. Snipper de ui en de knofloog. Snij de Chinese kool in sliertjes. Snij de lente-uien in ringen. Pel de scampi’s tot het staartje en maak ze schoon.
        
        
Verhit wat zonnebloemolie met enkele druppels sesamolie in een wok. Roerbak de knoflook, de gember en de ui 2 tot 3 minuten op middelhoog vuur. Voeg de scampi’s toe en roerbak tot ze roze kleuren. Kruid met peper. Voeg de kool en de sojascheuten toe, roerbak nog 1 minuutje mee.

       
Giet de noedels af en laat goed uitlekken. Doe ze mee in de wok en meng goed. Warm nog even door. Breng op smaak met de sojasaus, het limoensap en peper. Bestrooi met de lente-uitjes en roer nog even om. Werk af met koriander en sesamzaadjes. ''',
      categoryType: CategoryType.asian,
      video: 'none',
      audio: 'none'),
  Recipe(
      name: 'sandwich',
      image: 'assets/images/sandwich.jpg',
      guide:
          ''' Grill of bak de filet in olijfolie zoals beschreven op de verpakking.

Breng op smaak met peper en zout.

Snipper de tomaatjes fijn en roer ze door de kaas.

Voeg peper en zout naar smaak toe.

Snij het broodje in 2 in de lengte.

Smeer er de verse kaas op en verdeel er de sla over.

Snij de filet in plakjes en schik ze op het brood.''',
      categoryType: CategoryType.asian,
      video: 'assets/video/sandwich.mp4',
      audio: 'none'),
  Recipe(
      name: 'pizza',
      image: 'assets/images/pizza.jpg',
      guide:
          '''Verwarm de oven voor op 250°C en bekleed 2 bakplaten met bakpapier of bestrijk ze met olijfolie. Rol het pizzadeeg uit en snij hier 4 bodems van ongeveer 25cm diameter uit. Leg de pizzabodems op de bakplaten. 

Bestrijk de bodems royaal met tomatensaus en strooi hierna geraspte kaas en basilicumblaadje over de pizza. Kruid af met peper en zout en besprenkel met olijfolie.

Bak de pizza’s ongeveer 25 minuten in het midden van de oven. Snij de pizza in stukken met een pizzaroller en serveer.  ''',
      categoryType: CategoryType.itallian,
      video: 'none',
      audio: 'none'),
];
