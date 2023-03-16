#import "WechatPlugin.h"
#if __has_include(<wechat/wechat-Swift.h>)
#import <wechat/wechat-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "wechat-Swift.h"
#endif

@implementation WechatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWechatPlugin registerWithRegistrar:registrar];
}
@end
