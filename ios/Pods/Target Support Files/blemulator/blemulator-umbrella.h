#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BlemulatorPlugin.h"
#import "CharacteristicContainer.h"
#import "DartCallArgumentsConverter.h"
#import "DartResultConverter.h"
#import "DomainTypesConverter.h"
#import "DartMethodCaller.h"
#import "DartValueHandler.h"
#import "DartCallArgumentKeys.h"
#import "DartMethodName.h"
#import "DartResultKeys.h"
#import "PlatformMethodName.h"
#import "SimulationChannelName.h"
#import "DeviceContainer.h"
#import "BleError.h"
#import "BleErrorCode.h"
#import "AdvertisementData.h"
#import "Characteristic.h"
#import "ConnectionStateEvent.h"
#import "Descriptor.h"
#import "Peripheral.h"
#import "ScannedPeripheral.h"
#import "Service.h"
#import "BlemulatorCharacteristicResponse.h"
#import "BlemulatorDescriptorResponse.h"
#import "BlemulatorPeripheralResponse.h"
#import "SimulatedAdapter.h"
#import "ArrayUtilities.h"
#import "Base64Coder.h"
#import "BlemulatorCommonTypes.h"
#import "BlemulatorJSONStringifier.h"
#import "FlutterMethodCallHandler.h"
#import "StringUtilities.h"

FOUNDATION_EXPORT double blemulatorVersionNumber;
FOUNDATION_EXPORT const unsigned char blemulatorVersionString[];

