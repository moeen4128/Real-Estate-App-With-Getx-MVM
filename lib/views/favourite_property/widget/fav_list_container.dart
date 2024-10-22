import 'package:flutter/material.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/favourite_property/widget/list_tile_favourite.dart';

class FavouriteListContainer extends StatelessWidget {
  final PropertyModel property;
  const FavouriteListContainer({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  property.propertyImage,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Gaps.verticalGapOf(20),
              ListTileFavourite(property: property)
            ],
          ),
        ),
      ),
    );
  }
}
