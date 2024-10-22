import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/res/assets/image_assets.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:get/get.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

class ListTileWidget extends StatelessWidget {
  final PropertyModel property;

  const ListTileWidget({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>();

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      title: Text(
        property.propertyName,
        style: AppTextStyles.interHeading(
            fontSize: 20,
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.verticalGapOf(5),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 20,
                color: AppColors.textColor,
              ),
              Gaps.horizontalGapOf(5),
              Text(
                property.propertyLocation,
                style: AppTextStyles.interSubtitle(
                    color: AppColors.textColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      trailing: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              propertyController.saveProperty(property);
            },
            child: Obx(
              () => SvgPicture.asset(
                propertyController.savePropertyList.contains(property)
                    ? ImageAssets.savedIcon
                    : ImageAssets.unsavedIcon,
                height: 25,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
