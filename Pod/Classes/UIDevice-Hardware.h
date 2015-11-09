/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk
 
 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#import <UIKit/UIKit.h>

#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
#define DEVICE_IOS_VERSION [[UIDevice currentDevice].systemVersion floatValue]

#define DEVICE_HAS_RETINA_DISPLAY (fabs([UIScreen mainScreen].scale - 2.0) <= fabs([UIScreen mainScreen].scale - 2.0)*DBL_EPSILON)
#define IS_IOS7_OR_LATER (((double)(DEVICE_IOS_VERSION)-7.0) > -((double)(DEVICE_IOS_VERSION)-7.0)*DBL_EPSILON)
#define NSStringAdd568hIfIphone4inch(str) [NSString stringWithFormat:[UIDevice currentDevice].isIphoneWith4inchDisplay ? @"%@-568h" : @"%@", str]

#define IS_IPHONE_5 [[UIScreen mainScreen] applicationFrame].size.height == 568

typedef NS_ENUM(NSUInteger, UIDeviceFamily) {
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPod,
    UIDeviceFamilyiPad,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyUnknown,
};

typedef NS_ENUM(NSUInteger, UIDeviceGenerationModel) {
    UIDeviceGenerationModeliPhone3G,
    UIDeviceGenerationModeliPhone3GS,
    UIDeviceGenerationModeliPhone4,
    UIDeviceGenerationModeliPhone4S,
    UIDeviceGenerationModeliPhone5,
    UIDeviceGenerationModeliPhone5C,
    UIDeviceGenerationModeliPhone5S,
    UIDeviceGenerationModeliPhone6,
    UIDeviceGenerationModeliPhone6Plus,
    UIDeviceGenerationModeliPhone6S,
    UIDeviceGenerationModeliPhone6SPlus,
    UIDeviceGenerationModeliPhoneSimulator,
    UIDeviceGenerationModeliPad1,
    UIDeviceGenerationModeliPad2,
    UIDeviceGenerationModeliPad3,
    UIDeviceGenerationModeliPad4,
    UIDeviceGenerationModeliPadAir,
    UIDeviceGenerationModeliPadAir2,
    UIDeviceGenerationModeliPadMini1,
    UIDeviceGenerationModeliPadMini2,
    UIDeviceGenerationModeliPadMini3,
    UIDeviceGenerationModeliPadMini4,
    UIDeviceGenerationModeliPadPro,
    UIDeviceGenerationModeliPadSimulator,
    UIDeviceGenerationModeliPod1,
    UIDeviceGenerationModeliPod2,
    UIDeviceGenerationModeliPod3,
    UIDeviceGenerationModeliPod4,
    UIDeviceGenerationModeliPod5,
    UIDeviceGenerationModeliPod6,
    UIDeviceGenerationModelAppleTV1,
    UIDeviceGenerationModelAppleTV2,
    UIDeviceGenerationModelAppleTV3,
    UIDeviceGenerationModelAppleTV3_v2,
    UIDeviceGenerationModelAppleTV4,
    UIDeviceGenerationModelUnknown
};


typedef NS_ENUM(NSUInteger, UIDeviceModelInches) {
    UIDeviceModelInches35,
    UIDeviceModelInches4,
    UIDeviceModelInches47,
    UIDeviceModelInches55,
    UIDeviceModelInches79,
    UIDeviceModelInches97,
    UIDeviceModelInches129,
    UIDeviceModelInchesUnKnown
};


@interface UIDevice (Hardware)

/**
 Returns a machine-readable model name in the format of "iPhone4,1"
 */
- (NSString *)modelIdentifier;

/**
 Returns a human-readable model name in the format of "iPhone 4S". Fallback of the the `modelIdentifier` value.
 */
- (NSString *)modelName;

/**
 Returns the device generation model as a `UIDeviceGenerationModel`
 */
- (UIDeviceGenerationModel) deviceGenerationModel;

/**
 Returns the device generation model as a NSString `iPhone4`
 */
- (NSString*) deviceGenerationModelString;

/**
 Returns the device family as a `UIDeviceFamily`
 */
- (UIDeviceFamily)deviceFamily;

/**
 Returns the device Inches
 */
- (UIDeviceModelInches) deviceInches;

@end
