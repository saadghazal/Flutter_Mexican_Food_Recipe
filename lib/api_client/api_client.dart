import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mexican_food_recipes/models/meal_details_model.dart';
import 'package:mexican_food_recipes/models/meal_model.dart';


class ApiClient{
  static const baseURL = 'https://the-mexican-food-db.p.rapidapi.com/';
  static Map<String, String> headers = {
    'X-RapidAPI-Key': dotenv.get('clientApiKey'),
    'X-RapidAPI-Host': 'the-mexican-food-db.p.rapidapi.com',
  };

  static Future<List<MealModel>> fetchMeals()async{
    var url = Uri.parse(baseURL);
    var response = await http.get(url,headers: headers);
    final decodedData = jsonDecode(response.body);
    final mealsList = decodedData as List<dynamic>;


    return List.from(mealsList.map((e) => MealModel.fromJson(e),),);
  }
  static Future<MealDetailsModel> fetchMealById({required String id})async{
    var url = Uri.parse('$baseURL$id');
    var response = await http.get(url,headers: headers);
    final decodedData = jsonDecode(response.body);

    return MealDetailsModel.fromJson(decodedData);
  }
}