import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mexican_food_recipes/widgets/subtitle_text.dart';

class MealDescriptionWidget extends StatefulWidget {
  const MealDescriptionWidget({required this.description, super.key});
  final String description;

  @override
  State<MealDescriptionWidget> createState() => _MealDescriptionWidgetState();
}

class _MealDescriptionWidgetState extends State<MealDescriptionWidget> {
  bool descriptionReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final splittedDescription = widget.description.split(' ');
        var firstHalf = '';
        var secondHalf = '';

        if (splittedDescription.length <= 30) {
          firstHalf = widget.description;
        } else {
          for (int i = 0; i < splittedDescription.length; i++) {
            if (i < 30) {
              firstHalf += '${splittedDescription[i]} ';
            } else {
              secondHalf += '${splittedDescription[i]} ';
            }
          }
        }
        return splittedDescription.length > 30
            ? Column(
                children: [
                  descriptionReadMore
                      ? SubTitleText(
                          label: firstHalf + secondHalf,
                          textColor: Colors.grey.shade500,
                        )
                      : SubTitleText(
                          label: firstHalf,
                          textColor: Colors.grey.shade500,
                        ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        descriptionReadMore = !descriptionReadMore;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SubTitleText(
                          label:
                              descriptionReadMore ? ' Read Less' : ' Read More',
                          textColor: Color(0xFFF86F03),
                          fontWeight: FontWeight.w500,
                        ),
                        Icon(
                          descriptionReadMore
                              ? Icons.arrow_drop_up_rounded
                              : Icons.arrow_drop_down_rounded,
                          color: const Color(0xFFF86F03),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : SubTitleText(
                label: firstHalf,
                textColor: Colors.grey.shade500,
              );
      },
    );
  }
}
