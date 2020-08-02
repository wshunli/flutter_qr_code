#import "FlutterQrCodePlugin.h"
#if __has_include(<flutter_qr_code/flutter_qr_code-Swift.h>)
#import <flutter_qr_code/flutter_qr_code-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_qr_code-Swift.h"
#endif

@implementation FlutterQrCodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterQrCodePlugin registerWithRegistrar:registrar];
}
@end
