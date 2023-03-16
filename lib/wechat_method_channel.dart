import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wechat_platform_interface.dart';

/// An implementation of [WechatPlatform] that uses method channels.
class MethodChannelWechat extends WechatPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wechat');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
