import 'package:flutter_test/flutter_test.dart';
import 'package:wechat/wechat.dart';
import 'package:wechat/wechat_platform_interface.dart';
import 'package:wechat/wechat_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWechatPlatform
    with MockPlatformInterfaceMixin
    implements WechatPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WechatPlatform initialPlatform = WechatPlatform.instance;

  test('$MethodChannelWechat is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWechat>());
  });

  test('getPlatformVersion', () async {
    Wechat wechatPlugin = Wechat();
    MockWechatPlatform fakePlatform = MockWechatPlatform();
    WechatPlatform.instance = fakePlatform;

    expect(await wechatPlugin.getPlatformVersion(), '42');
  });
}
