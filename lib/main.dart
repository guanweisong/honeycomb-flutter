import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/menu_controller.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/routes/app_pages.dart';
import 'package:honeycomb_flutter/theme/app_theme.dart';
import 'package:honeycomb_flutter/pages/list/page.dart';

void main() {
  Get.put<MenuController>(MenuController(), permanent: true);
  Get.put<SettingController>(SettingController(), permanent: true);
  runApp(GetMaterialApp(
    theme: appThemeData,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: true,
    home: ListPage(),
  ));
}
