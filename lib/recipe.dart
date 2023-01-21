import 'package:flutter/material.dart';

class Recipe {
  Recipe({required this.name, required this.description, required this.notes,
    required this.selectedTags,this.isFavorite = false,required this.ingredients,
    required this.method, required this.cookingTime, required this.preparingTime,
      required this.hours, required this.minutes, required this.seconds
        });

  final String name;
  final String description;
  final String notes;
  final List<String> selectedTags;
  bool isFavorite = true;
  final String ingredients;
  final String method;
  final String cookingTime;
  final String preparingTime;

  final int hours;
  final int minutes;
  final int seconds;

  Map<String,dynamic> toMap(){
    return{
      "name" : name,
      "description" : description,
      "notes" : notes,
      "selectedTags" : selectedTags,
      "isFavorite" : isFavorite,
      "ingredients" : ingredients,
      "method" : method,
      "cookingTime" : cookingTime,
      "preparingTime" : preparingTime,
      "hours" : hours,
      "minutes" : minutes,
      "seconds" : seconds

    };
  }
}










