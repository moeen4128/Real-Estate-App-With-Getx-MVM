import 'package:flutter/widgets.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';

Row spaceBetweenRow(String leadingString, String trailingString) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leadingString,
        style: AppTextStyles.poppinsMedium(),
      ),
      Text(
        trailingString,
        style: AppTextStyles.interBody(
            color: AppColors.textColor, fontWeight: FontWeight.normal),
      ),
    ],
  );
}
