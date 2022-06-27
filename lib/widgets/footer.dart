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
        opacity: 0.7,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Text(
                settingController.setting?.siteSignature ?? '',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                settingController.setting?.siteCopyright ?? '',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
