import 'dart:io';
import 'package:flutter/services.dart';
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
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
