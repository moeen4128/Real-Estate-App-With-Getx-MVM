import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/dimensions.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/home/widgets/property_list_container.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

class SavedPropertyView extends StatelessWidget {
  const SavedPropertyView({super.key});

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
                  'Saved Items',
                  style: AppTextStyles.poppinsMedium(),
                ),
                Gaps.verticalGapOf(20),
                propertyController.savePropertyList.isEmpty
                    ? Center(
                        child: Text(
                          'No Saved List',
                          style: AppTextStyles.interBody(
                              color: AppColors.secondaryColor),
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        padding: const EdgeInsets.only(bottom: 10),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: propertyController.savePropertyList.length,
                        itemBuilder: (context, index) => FadeInUp(
                          duration: const Duration(seconds: 1),
                          child: PropertyListContainer(
                            property:
                                propertyController.savePropertyList[index],
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
