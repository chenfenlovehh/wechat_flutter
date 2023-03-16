
import 'wechat_platform_interface.dart';

class Wechat {
  Future<String?> getPlatformVersion() {
    return WechatPlatform.instance.getPlatformVersion();
  }
}
