import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/res/routes/routes_name.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/views/property_detail/widgets/list_tile_widget.dart';

class PropertyListContainer extends StatelessWidget {
  final PropertyModel property;
  const PropertyListContainer({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 1,
              spreadRadius: 0.3,
              color: AppColors.hintText,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () =>
                  Get.toNamed(RouteName.propertyRoute, arguments: [property]),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      property.propertyImage,
                      fit: BoxFit.cover,
                      height: 220, // Fixed height for image
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '\$ ',
                            style: AppTextStyles.poppinsNormal(
                                color: AppColors.white),
                          ),
                          Text(
                            '${property.propertyPrice}/month ',
                            style: AppTextStyles.poppinsNormal(
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: InkWell(
                  onTap: () => Get.toNamed(RouteName.propertyRoute,
                      arguments: [property]),
                  child: ListTileWidget(property: property)),
            )
          ],
        ),
      ),
    );
  }
}
