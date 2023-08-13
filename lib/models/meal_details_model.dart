// To parse this JSON data, do
//
//     final mealDetailsModel = mealDetailsModelFromJson(jsonString);

import 'dart:convert';

MealDetailsModel mealDetailsModelFromJson(String str) =>
    MealDetailsModel.fromJson(json.decode(str));

class MealDetailsModel {
  String id;
  String title;
  String difficulty;
  String portion;
  String time;
  String description;
  List<String> ingredients;
  Method method;
  String image;

  MealDetailsModel({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.portion,
    required this.time,
    required this.description,
    required this.ingredients,
    required this.method,
    required this.image,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) =>
      MealDetailsModel(
        id: json["id"],
        title: json["title"],
        difficulty: json["difficulty"],
        portion: json["portion"],
        time: json["time"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        method: Method.fromJson(json['method']),
        image: json["image"],
      );
}

class Method {
  List<String> steps;

  Method({
    required this.steps,
  });

  factory Method.fromJson(List<dynamic> json) {
    List<String> steps = [];
    for (int i = 0; i < json.length; i++) {
      steps.add(json[i]['Step ${i + 1}']);
    }
    return Method(steps: steps);
  }
}
