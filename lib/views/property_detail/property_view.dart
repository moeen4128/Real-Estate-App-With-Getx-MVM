import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/utils/dimensions.dart';

import 'package:real_estate/views/property_detail/widgets/bottomsheet_property.dart';
import 'package:real_estate/views/property_detail/widgets/property_detail_widget.dart';
import 'package:real_estate/views/property_detail/widgets/top_image_widget.dart';

class PropertyView extends StatelessWidget {
  const PropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyModel property = Get.arguments[0];
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TopImageWidget(property: property),
              Padding(
                padding: const EdgeInsetsDirectional.all(
                    Dimensions.paddingSizeDefault),
                child: PropertyDetailWidget(property: property),
              )
            ],
          ),
        ),
        bottomSheet: BottomSheetProperty(
          price: property.propertyPrice,
        ));
  }
}
