import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';

import 'package:real_estate/utils/app_constants.dart';
import 'package:real_estate/utils/dimensions.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/home/widgets/category_list.dart';
import 'package:real_estate/views/home/widgets/property_list_container.dart';
import 'package:real_estate/views/home/widgets/spacebetween_widget.dart';
import 'package:real_estate/views/home/widgets/top_bar_home_widget.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: ListView(
          children: [
            FadeInUp(
                duration: const Duration(seconds: 3),
                child: const TopBarHomWidget()),
            Gaps.verticalGapOf(20),
            spaceBetweenRow('Featured Properties', 'more'),
            Gaps.verticalGapOf(20),
            SizedBox(
              height: Get.height * 0.42,
              child: Obx(
                () => ListView.builder(
                  primary: false,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: propertyController.filteredList.isEmpty
                      ? 1
                      : propertyController.filteredList.length,
                  itemBuilder: (context, index) => propertyController
                          .filteredList.isEmpty
                      ? Center(
                          child: Align(
                            child: Text(
                              'No Such Property Found',
                              style: AppTextStyles.poppinSmall(),
                            ),
                          ),
                        )
                      : FadeInRight(
                          duration: const Duration(seconds: 3),
                          child: PropertyListContainer(
                            property: propertyController.filteredList[index],
                          ),
                        ),
                ),
              ),
            ),
            Gaps.verticalGapOf(20),
            spaceBetweenRow('Search by type', 'more'),
            Gaps.verticalGapOf(20),
            SizedBox(
              height: 130,
              child: ListView.builder(
                primary: false,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: AppConstants.categories.length,
                itemBuilder: (context, index) => FadeInDown(
                  duration: const Duration(seconds: 3),
                  child: CategoryListContainer(
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
