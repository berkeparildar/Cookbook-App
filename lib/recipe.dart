import 'package:flutter/material.dart';

class Recipe {
  Recipe({required this.name, required this.description, required this.notes,
    required this.selectedTags,this.isFav = false,required this.ingredients,
    this.method});
  final String name;
  final String description;
  final String notes;
  final List<String> selectedTags;
  bool isFav = true;
  final String ingredients;
  String? method;
}


