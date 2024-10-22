import 'package:flutter/material.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/app_constants.dart';

class CategoryListContainer extends StatelessWidget {
  final int index;
  const CategoryListContainer({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = AppConstants.categories[index];
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              category.imageUrl,
              height: 130,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  category.title,
                  style: AppTextStyles.interBody(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
