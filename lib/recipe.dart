import 'package:flutter/material.dart';

class Recipe {
  Recipe({required this.name, required this.description, required this.notes,
    required this.selectedTags});
  final String name;
  final String description;
  final String notes;
  final List<String> selectedTags;
}
