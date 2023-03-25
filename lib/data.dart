import 'package:flutter/material.dart';

enum CategoryType { itallian, dessert, asian }

class Recipe {
  String name;
  String image;
  String guide;
  String video;
  CategoryType categoryType;

  Recipe({
    required this.name,
    required this.image,
    required this.categoryType,
    required this.guide,
    required this.video,
  }) {
    this.name = name;
    this.image = image;
    this.guide = guide;
    this.categoryType = categoryType;
    this.video = video;
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
      video: 'assets/video/tiramisu.mp4'),
  Recipe(
    name: 'spaghetti',
    image: 'assets/images/Spaghetti.jpg',
    guide: 'Shepherd',
    categoryType: CategoryType.itallian,
    video: 'none',
  ),
];
