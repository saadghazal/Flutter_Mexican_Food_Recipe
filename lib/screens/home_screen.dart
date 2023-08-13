import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexican_food_recipes/controllers/meals_controller.dart';
import 'package:mexican_food_recipes/widgets/meal_card_widget.dart';

class HomeScreen extends GetView<MealsController> {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                'assets/logo/mexican_logo.png',
                height: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Mexican Guy',
                style: TextStyle(
                  fontFamily: 'Ruwudu',
                  fontSize: 14,
                  color: Color(0xFF272829),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Food List',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder(
                builder: (MealsController _) {
                  return controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            itemBuilder: (context, index) {
                              return MealCardWidget(
                                mealModel: controller.meals[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemCount: controller.meals.length,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
