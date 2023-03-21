import 'package:flutter/material.dart';

const activeColor = Color(0xFF416d6d);
const inActiveColor = Color.fromARGB(255, 179, 218, 218);

enum CategoryType { dog, cat, parrot }

class Pet {
  String name;
  String image;
  String species;
  CategoryType categoryType;

  Pet({
    required this.name,
    required this.image,
    required this.categoryType,
    required this.species,
  }) {
    this.name = name;
    this.image = image;
    this.species = species;
    this.categoryType = categoryType;
  }
}

Pet petDog1 = Pet(
    name: 'dog 1',
    image: 'assets/images/dog1.jpg',
    species: 'Shepherd',
    categoryType: CategoryType.cat,
    );

Pet petDog2 = Pet(
    name: 'dog 2',
    image: 'assets/images/dog2.jpg',
    species: 'Husky',
    categoryType: CategoryType.cat,
    );

Pet petCat1 = Pet(
    name: 'cat 1',
    image: 'assets/images/cat1.jpg',
    species: 'Brit',
    categoryType: CategoryType.cat,
    );

Pet petCat2 = Pet(
    name: 'cat 2',
    image: 'assets/images/cat2.jpg',
    species: 'Siamese',
    categoryType: CategoryType.cat,
    );

Pet petBird1 = Pet(
    name: 'bird 1',
    image: 'assets/images/bird1.jpg',
    species: 'Falcon',
    categoryType: CategoryType.cat,
    );

Pet petBird2 = Pet(
    name: 'bird 2',
    image: 'assets/images/bird2.jpg',
    species: 'Pigeon',
    categoryType: CategoryType.cat,
);