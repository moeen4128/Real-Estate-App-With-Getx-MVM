import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/res/assets/image_assets.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

class TopImageWidget extends StatelessWidget {
  final PropertyModel property;
  const TopImageWidget({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>();

    return Stack(
      children: [
        Image.asset(
          property.propertyImage,
          height: Get.height * 0.45,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 15,
          top: 40,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.7),
                shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new),
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.7),
                shape: BoxShape.circle),
            child: Center(
              child: InkWell(
                onTap: () => propertyController.saveFavouriteProperty(property),
                child: Obx(
                  () => SvgPicture.asset(
                    propertyController.favPropertyList.contains(property)
                        ? ImageAssets.filledHeart
                        : ImageAssets.unfilledHeart,
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
