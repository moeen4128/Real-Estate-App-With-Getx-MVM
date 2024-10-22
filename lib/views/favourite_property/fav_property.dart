import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/dimensions.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/favourite_property/widget/fav_list_container.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

class FavouritePropertyView extends StatelessWidget {
  const FavouritePropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Favourite Items',
                  style: AppTextStyles.poppinsMedium(),
                ),
                Gaps.verticalGapOf(20),
                propertyController.favPropertyList.isEmpty
                    ? Center(
                        child: Text(
                          'No Favourite Property',
                          style: AppTextStyles.interBody(
                              color: AppColors.secondaryColor),
                        ),
                      )
                    : FadeInLeft(
                        duration: const Duration(seconds: 2),
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: propertyController.favPropertyList.length,
                          itemBuilder: (context, index) =>
                              FavouriteListContainer(
                            property: propertyController.favPropertyList[index],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
