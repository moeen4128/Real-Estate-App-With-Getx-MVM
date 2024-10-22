import 'package:flutter/material.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/property_detail/widgets/list_tile_widget.dart';

class PropertyDetailWidget extends StatelessWidget {
  final PropertyModel property;
  const PropertyDetailWidget({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileWidget(property: property),
        Gaps.verticalGapOf(10),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            accessoriesChip(Icons.bed, 'Bedrooms', property.propertyBeds),
            accessoriesChip(
                Icons.bathtub, 'Bathrooms', property.propertyBathroom),
            accessoriesChip(Icons.apartment, 'floor', property.propertyFloor),
            accessoriesChip(
                Icons.square_foot, 'sq.foot', property.propertyArea),
          ],
        ),
        Gaps.verticalGapOf(20),
        Text(
          'Description',
          style: AppTextStyles.interHeading(
              fontSize: 20,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold),
        ),
        Gaps.verticalGapOf(10),
        Text(
          maxLines: 4,
          property.propertyDescription,
          style: AppTextStyles.interBody(
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}

Chip accessoriesChip(
  IconData icon,
  String chipTitle,
  int count,
) {
  return Chip(
    backgroundColor: AppColors.white,
    labelPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    avatar: Icon(
      icon,
      color: AppColors.textColor,
    ),
    label: Text('$count $chipTitle'),
    labelStyle: AppTextStyles.interSubtitle(color: AppColors.textColor),
  );
}
