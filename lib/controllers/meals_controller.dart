import 'package:get/get.dart';
import 'package:mexican_food_recipes/api_client/api_client.dart';
import 'package:mexican_food_recipes/models/meal_details_model.dart';

import '../models/meal_model.dart';

class MealsController extends GetxController {
  List<MealModel> _meals = [];
  List<MealModel> get meals {
    return _meals;
  }
  late MealDetailsModel _selectedMeal;
  MealDetailsModel get selectedMeal {
    return _selectedMeal;
  }

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    _isLoading = true;
    _meals = await ApiClient.fetchMeals();
    _isLoading = false;
    update();
  }
  Future<void> selectMeal({required String id})async{
    _isLoading = true;
    _selectedMeal = await ApiClient.fetchMealById(id: id);
    _isLoading = false;
    update(['mealScreen']);
  }
}
