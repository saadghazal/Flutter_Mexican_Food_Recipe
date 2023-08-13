import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexican_food_recipes/controllers/meals_controller.dart';
import 'package:mexican_food_recipes/models/meal_model.dart';
import 'package:mexican_food_recipes/screens/meal_screen.dart';

class MealCardWidget extends StatelessWidget {
  const MealCardWidget({required this.mealModel, super.key});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Get.toNamed(MealScreen.routeName);
        await Get.find<MealsController>().selectMeal(id: mealModel.id);

      },
      child: Container(
        height: 100,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(mealModel.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealModel.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    'Difficulty: ${mealModel.difficulty}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}
