import 'package:get/get.dart';
import 'package:real_estate/res/routes/routes_name.dart';
import 'package:real_estate/views/bottom_nav_home/bottom_nav_home.dart';
import 'package:real_estate/views/favourite_property/fav_property.dart';
import 'package:real_estate/views/home/home_view.dart';
import 'package:real_estate/views/property_detail/property_view.dart';
import 'package:real_estate/views/saved_property/saved_property.dart';
import 'package:real_estate/views/splash/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashRoute,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(microseconds: 500),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeRoute,
          page: () => const HomeView(),
          transitionDuration: const Duration(microseconds: 500),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.bottomNavRoute,
          page: () => const BottomNavHome(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.propertyRoute,
          page: () => const PropertyView(),
          transitionDuration: const Duration(microseconds: 800),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.favPropertyRoute,
          page: () => const FavouritePropertyView(),
          transitionDuration: const Duration(microseconds: 800),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.savedPropertyRoute,
          page: () => const SavedPropertyView(),
          transitionDuration: const Duration(microseconds: 800),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
