import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/views/bottom_nav_home/nav_controller/nav_controller.dart';
import 'package:real_estate/views/bottom_nav_home/widget/buil_nav_bar.dart';
import 'package:real_estate/views/favourite_property/fav_property.dart';
import 'package:real_estate/views/home/home_view.dart';
import 'package:real_estate/views/saved_property/saved_property.dart';

class BottomNavHome extends StatelessWidget {
  const BottomNavHome({super.key});

  @override
  Widget build(BuildContext context) {
    const navScreens = [
      HomeView(),
      FavouritePropertyView(),
      SavedPropertyView()
    ];
    final navController = Get.put(NavPageController());
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, navController),
      body: Obx(
        () => Stack(
          children: List.generate(
            navScreens.length,
            (index) => Visibility(
              maintainState: true,
              visible: navController.tabIndex.value == index,
              child: navScreens[index],
            ),
          ),
        ),
      ),
    ));
  }
}
