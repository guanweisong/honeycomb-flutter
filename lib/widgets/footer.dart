import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:get/get.dart';

class Footer extends GetView {
  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find<SettingController>();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Opacity(
        opacity: 0.5,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Obx(
                () => Text(
                  settingController.setting.value.siteSignature ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Obx(
                () => Text(
                  settingController.setting.value.siteCopyright ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
