import 'package:flutter/material.dart';
import 'data2.dart';

class Scherm3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return DeleteRecipeWidget();
  }
}

class DeleteRecipeWidget extends StatefulWidget {
  @override
  _DeleteRecipeWidgetState createState() => _DeleteRecipeWidgetState();
}

class _DeleteRecipeWidgetState extends State<DeleteRecipeWidget> {
  String? _selectedRecipe;

  void _deleteSelectedRecipe() {
    if (_selectedRecipe != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to delete this recipe?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteRecipe(_selectedRecipe!);
                setState(() {
                  _selectedRecipe = null;
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      );
    }
  }

  void _deleteAllRecipes() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to delete all recipes?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              deleteAllRecipes();
              setState(() {
                _selectedRecipe = null;
              });
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return recipes.map((recipe) {
      return DropdownMenuItem<String>(
        value: recipe.name,
        child: Text(recipe.name),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to delete all recipes?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: _deleteAllRecipes,
                    child: Text('Delete'),
                  ),
                ],
              ),
            );
          },
          child: Text('Delete All Recipes'),
        ),
        SizedBox(height: 16),
        DropdownButton(
          value: _selectedRecipe,
          items: _buildDropdownItems(),
          onChanged: (value) {
            setState(() {
              _selectedRecipe = value as String?;
            });
          },
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _deleteSelectedRecipe,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
