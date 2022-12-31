import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final String description;
  final String notes;
  final List<String> selectedTags;

  Recipe({required this.name, required this.description, required this.notes,
    required this.selectedTags});
}
