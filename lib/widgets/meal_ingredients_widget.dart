import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mexican_food_recipes/models/meal_details_model.dart';
import 'package:mexican_food_recipes/widgets/subtitle_text.dart';

class MealIngredientsWidget extends StatefulWidget {
  const MealIngredientsWidget({required this.selectedMeal, super.key});
  final MealDetailsModel selectedMeal;

  @override
  State<MealIngredientsWidget> createState() => _MealIngredientsWidgetState();
}

class _MealIngredientsWidgetState extends State<MealIngredientsWidget> {
  bool ingredientsReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.selectedMeal.ingredients.length > 5,
        replacement: Column(
          children: List.generate(
            widget.selectedMeal.ingredients.length,
            (index) {
              return Column(
                children: [
                  SubTitleText(
                      label:
                          '${index + 1}- ${widget.selectedMeal.ingredients[index]}',
                      textColor: Colors.grey.shade500),
                  index != widget.selectedMeal.ingredients.length
                      ? const SizedBox(
                          height: 10,
                        )
                      : const SizedBox(),
                ],
              );
            },
          ),
        ),
        child: ingredientsReadMore
            ? expandedIngredients(
                ingredients: widget.selectedMeal.ingredients,
                length: widget.selectedMeal.ingredients.length,
                onTap: () {
                  setState(() {
                    ingredientsReadMore = !ingredientsReadMore;
                  });
                },
                isReadMore: ingredientsReadMore,
              )
            : expandedIngredients(
                ingredients: widget.selectedMeal.ingredients,
                length: 5,
                onTap: () {
                  setState(() {
                    ingredientsReadMore = !ingredientsReadMore;
                  });
                },
                isReadMore: ingredientsReadMore,
              ));
  }
}

Widget expandedIngredients(
    {required List<String> ingredients,
    required int length,
    required VoidCallback onTap,
    required bool isReadMore}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(
      length + 1,
      (index) {
        return Column(
          children: [
            index == length
                ? GestureDetector(
                    onTap: onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SubTitleText(
                          label: isReadMore ? ' Read Less' : ' Read More',
                          textColor: Color(0xFFF86F03),
                          fontWeight: FontWeight.w500,
                        ),
                        Icon(
                          isReadMore
                              ? Icons.arrow_drop_up_rounded
                              : Icons.arrow_drop_down_rounded,
                          color: Color(0xFFF86F03),
                        ),
                      ],
                    ),
                  )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubTitleText(
                      label: '${index + 1} - ',
                      textColor: Color(0xFFF86F03),
                      fontWeight: FontWeight.w500,
                    ),

                    Flexible(
                      child: SubTitleText(
                          label: ingredients[index],
                          textColor: Colors.grey.shade500,
                        ),
                    ),
                  ],
                ),
            index != length
                ? const SizedBox(
                    height: 10,
                  )
                : const SizedBox(),
          ],
        );
      },
    ),
  );
}
