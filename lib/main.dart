import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/res/routes/routes.dart';
import 'package:real_estate/res/theme/colors.dart';
import 'package:real_estate/views/property_detail/controller/property_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(PropertyController()); // Initialize controller
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
      themeMode: ThemeMode.light,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
    );
  }
}
