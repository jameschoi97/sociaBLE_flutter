//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<blemulator/BlemulatorPlugin.h>)
#import <blemulator/BlemulatorPlugin.h>
#else
@import blemulator;
#endif

#if __has_include(<flutter_ble_lib/FlutterBleLibPlugin.h>)
#import <flutter_ble_lib/FlutterBleLibPlugin.h>
#else
@import flutter_ble_lib;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BlemulatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"BlemulatorPlugin"]];
  [FlutterBleLibPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBleLibPlugin"]];
}

@end
