import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexican_food_recipes/controllers/meals_controller.dart';
import 'package:mexican_food_recipes/widgets/meal_description_widget.dart';
import 'package:mexican_food_recipes/widgets/meal_ingredients_widget.dart';
import 'package:mexican_food_recipes/widgets/subtitle_text.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  static const routeName = '/meal';

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  bool descriptionReadMore = false;
  bool ingredientsReadMore = false;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      body: GetBuilder<MealsController>(
        id: 'mealScreen',
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: 100,
                      expandedHeight: 200,
                      pinned: true,
                      bottom: mealTitle(title: controller.selectedMeal.title),
                      flexibleSpace: mealBackgroundImage(
                        context: context,
                        image: controller.selectedMeal.image,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: bottom == 0 ? 30 : bottom,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            section(
                              label: 'Difficulty',
                              description: controller.selectedMeal.description,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            section(
                              label: 'Portion',
                              description: controller.selectedMeal.portion,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            section(
                              label: 'Time to prepare',
                              description: controller.selectedMeal.time,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            title(label: 'Description'),
                            const SizedBox(
                              height: 5,
                            ),
                            MealDescriptionWidget(
                                description:
                                    controller.selectedMeal.description),
                            const SizedBox(
                              height: 10,
                            ),
                            title(label: 'Ingredients'),
                            const SizedBox(
                              height: 10,
                            ),
                            MealIngredientsWidget(
                              selectedMeal: controller.selectedMeal,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            title(label: 'Cooking Method'),
                            const SizedBox(
                              height: 10,
                            ),
                            for (int i = 0;
                                i < controller.selectedMeal.method.steps.length;
                                i++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubTitleText(
                                    label: 'Step ${i + 1}',
                                    textColor: const Color(0xFFF86F03),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SubTitleText(
                                    label:
                                        controller.selectedMeal.method.steps[i],
                                    textColor: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

Widget section({required String label, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title(label: label),
      const SizedBox(
        height: 5,
      ),
      SubTitleText(
        label: description,
        textColor: Colors.grey.shade500,
      ),
    ],
  );
}

Widget title({required String label}) {
  return Text(
    label,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );
}

PreferredSize mealTitle({required String title}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(20),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget mealBackgroundImage({
  required BuildContext context,
  required String image,
}) {
  return Stack(
    children: [
      SizedBox(
        width: double.maxFinite,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + 10,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
