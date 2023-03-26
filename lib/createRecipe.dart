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

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Recipe created'),
        content: Text(
            'Je recept is met succes toegevoegd,\n aub filter op alle om de toevoeging te zien,\n of maak nog een nieuw recept aan'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
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
                labelText:
                    'ImageUrl:  zoek het liefst een plaatje van imgur.com',
              ),
            ),
            DropdownButton<CategoryType>(
              isExpanded: true,
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
                _showSuccessDialog();
              },
              child: Text('Create Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
