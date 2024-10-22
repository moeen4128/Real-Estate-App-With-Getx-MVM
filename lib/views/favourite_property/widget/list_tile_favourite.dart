import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/res/assets/image_assets.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

class ListTileFavourite extends StatelessWidget {
  final PropertyModel property;

  const ListTileFavourite({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.propertyName,
                style: AppTextStyles.interHeading(
                  fontSize: 20,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.verticalGapOf(5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Gaps.verticalGapOf(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: " \$${property.propertyPrice}",
                                style: AppTextStyles.poppinsMedium(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const TextSpan(
                                text: " /month",
                                style: TextStyle(
                                  color: AppColors.hintText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gaps.horizontalGapOf(20),
                        Row(
                          children: [
                            const Icon(
                              Icons.bed,
                              color: AppColors.primaryColor,
                            ),
                            Gaps.horizontalGapOf(3),
                            Text(
                              '${property.propertyBeds}',
                              style: AppTextStyles.interSmall(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Gaps.horizontalGapOf(10),
                            const Icon(
                              Icons.bathtub,
                              color: AppColors.primaryColor,
                            ),
                            Gaps.horizontalGapOf(3),
                            Text(
                              '${property.propertyBathroom}',
                              style: AppTextStyles.interSmall(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildFavoriteIcon(propertyController, property),
      ],
    );
  }

  Widget _buildFavoriteIcon(
      PropertyController propertyController, PropertyModel property) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: AppColors.lightGrey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            propertyController.saveFavouriteProperty(property);
          },
          child: Obx(
            () => SvgPicture.asset(
              propertyController.favPropertyList.contains(property)
                  ? ImageAssets.filledHeart
                  : ImageAssets.unfilledHeart,
              height: 40,
              colorFilter: const ColorFilter.mode(
                AppColors.redColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
