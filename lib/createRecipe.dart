import 'package:flutter/material.dart';
import 'data2.dart';

class CreateRecipe extends StatefulWidget {
  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _guideController = TextEditingController();
  CategoryType _categoryType = CategoryType.itallian;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            controller: _imageController,
            decoration: InputDecoration(
              labelText: 'Image',
            ),
          ),
          DropdownButton<CategoryType>(
            value: _categoryType,
            onChanged: (CategoryType? newValue) {
              setState(() {
                _categoryType = newValue!;
              });
            },
            items: CategoryType.values
                .map<DropdownMenuItem<CategoryType>>((CategoryType value) {
              return DropdownMenuItem<CategoryType>(
                value: value,
                child: Text(value.toString().split('.').last),
              );
            }).toList(),
          ),
          TextFormField(
            controller: _guideController,
            decoration: InputDecoration(
              labelText: 'Guide',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addRecipe(
                _nameController.text,
                _imageController.text,
                _categoryType,
                _guideController.text,
              );
              Navigator.pop(context);
            },
            child: Text('Create Recipe'),
          ),
        ],
      ),
    );
  }
}
