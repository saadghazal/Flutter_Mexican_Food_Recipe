import 'package:get/get.dart';
import 'package:mexican_food_recipes/controllers/meals_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MealsController(),
    );
  }
}
