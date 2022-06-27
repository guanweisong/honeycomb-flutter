import 'package:honeycomb_flutter/models/entity/setting.dart';
import 'package:honeycomb_flutter/models/response/base_response.dart';
import 'package:honeycomb_flutter/utils/api.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  Setting? setting;

  @override
  onReady() {
    getSetting();
  }

  // 获取站点配置
  getSetting() async {
    var res = await querySetting();
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      setting = Setting.fromJson(response.data[0]);
      update();
    }
  }
}
