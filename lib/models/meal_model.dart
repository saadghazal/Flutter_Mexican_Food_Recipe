import 'package:equatable/equatable.dart';

class MealModel extends Equatable {
  final String id;
  final String title;
  final String difficulty;
  final String image;

  const MealModel({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.image,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      title: json['title'],
      difficulty: json['difficulty'],
      image: json['image'],
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        difficulty,
        image,
      ];

  @override
  String toString() {
    return 'MealModel{id: $id, title: $title, difficulty: $difficulty, image: $image}';
  }
}
