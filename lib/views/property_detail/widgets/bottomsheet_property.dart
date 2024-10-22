import 'package:flutter/material.dart';
import 'package:real_estate/res/components/custom_button.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';

class BottomSheetProperty extends StatelessWidget {
  final double price;
  const BottomSheetProperty({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (context) {
        return Container(
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Rs. $price",
                        style: AppTextStyles.poppinsTitle(
                            color: AppColors.textColor),
                      ),
                      const TextSpan(
                          text: " /month",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CustomButtonWidget(
                  title: 'Book',
                  onPress: () {},
                  width: 140,
                )
              ],
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
