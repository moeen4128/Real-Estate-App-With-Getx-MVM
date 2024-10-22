import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>();

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 0.5,
                color: AppColors.hintText,
              )
            ]),
        child: TextField(
          onChanged: (value) => propertyController.searchQuery.value = value,
          decoration: InputDecoration(
              labelText: 'Location',
              labelStyle:
                  AppTextStyles.interBody(color: AppColors.primaryColor),
              hintText: 'Lahore, Pakistan',
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.primaryColor,
                size: 30,
              ),
              suffixIcon: const Icon(
                Icons.filter_list_rounded,
                color: AppColors.primaryColor,
                size: 30,
              )),
        ));
  }
}
