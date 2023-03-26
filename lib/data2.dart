import 'package:flutter/material.dart';

enum CategoryType { itallian, dessert, asian }

class Recipe {
  String name;
  String image;
  String guide;
  CategoryType categoryType;

  Recipe({
    required this.name,
    required this.image,
    required this.categoryType,
    required this.guide,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      image: json['image'],
      categoryType: CategoryType.values[json['categoryType']],
      guide: json['guide'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'categoryType': categoryType.index,
      'guide': guide,
    };
  }
}

List<Recipe> recipes = [
  Recipe(
    name: 'tiramisu',
    image:
        'https://img.static-rmg.be/a/food/image/q75/w640/h400/15481/tiramisu-basisrecept.jpg',
    guide:
        '''Splits de eieren. Meng de dooiers met de mascarpone en de fijne suiker. Klop het eiwit stijf samen met de vanillesuiker. Spatel het door de mascarpone.

        Meng de koffie met de amaretto. Dompel er de helft van de koekjes in en schik ze in een schaal. Bestrijk met de helft van de mascarponecrème en bestrooi met cacaopoeder.
        
        Leg daarop de rest van de koekjes en bestrijk met de rest van de crème. Eindig met cacaopoeder en poedersuiker. Zet 1 nacht in de koelkast.''',
    categoryType: CategoryType.dessert,
  ),
  Recipe(
    name: 'spaghetti',
    image: 'https://i.imgur.com/4Hu5HB9.jpeg',
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
  ),
];

void addRecipe(
    String name, String image, CategoryType categoryType, String guide) {
  Recipe newRecipe = Recipe(
    name: name,
    image: image,
    categoryType: categoryType,
    guide: guide,
  );
  recipes.add(newRecipe);
}

void deleteRecipe(String recipeName) {
  recipes.removeWhere((recipe) => recipe.name == recipeName);
}

void deleteAllRecipes() {
  recipes.clear();
}
