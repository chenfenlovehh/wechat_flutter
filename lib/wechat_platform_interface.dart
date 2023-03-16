import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wechat_method_channel.dart';

abstract class WechatPlatform extends PlatformInterface {
  /// Constructs a WechatPlatform.
  WechatPlatform() : super(token: _token);

  static final Object _token = Object();

  static WechatPlatform _instance = MethodChannelWechat();

  /// The default instance of [WechatPlatform] to use.
  ///
  /// Defaults to [MethodChannelWechat].
  static WechatPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WechatPlatform] when
  /// they register themselves.
  static set instance(WechatPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
