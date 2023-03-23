import 'package:flutter/material.dart';

enum CategoryType { itallian, dessert, asian }

class recipe {
  String name;
  String image;
  String guide;
  CategoryType categoryType;

  recipe({
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

recipe tiramisu = recipe(
  name: 'dog 1',
  image: 'assets/images/dog1.jpg',
  guide: 'Shepherd',
  categoryType: CategoryType.dessert,
);
