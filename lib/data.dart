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
  }) {
    this.name = name;
    this.image = image;
    this.guide = guide;
    this.categoryType = categoryType;
  }
}

List<Recipe> recipes = [
  Recipe(
    name: 'tiramisu',
    image: 'assets/images/tiramisu.jpg',
    guide: 'Shepherd',
    categoryType: CategoryType.dessert,
  ),
  Recipe(
    name: 'spaghetti',
    image: 'assets/images/Spaghetti.jpg',
    guide: 'Shepherd',
    categoryType: CategoryType.itallian,
  ),
];
