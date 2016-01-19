/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk
 
 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#include <sys/sysctl.h>
#import "UIDevice-Hardware.h"

@interface UIDevice (Hardward)

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier;

@end

@implementation UIDevice (Hardware)

- (NSString *)getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

- (NSString *)modelIdentifier
{
    return [self getSysInfoByName:"hw.machine"];
}

- (NSString *)modelName
{
    return [self modelNameForModelIdentifier:[self modelIdentifier]];
}

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier
{
    // iPhone http://theiphonewiki.com/wiki/IPhone
    
    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    // iPad http://theiphonewiki.com/wiki/IPad
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2 (Rev A)";
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    
    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini 2G (Cellular)"; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3G (Cellular)";
    
    // iPod http://theiphonewiki.com/wiki/IPod
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch 6G"; // as 6,1 was never released 7,1 is actually 6th generation
    
    // Apple TV https://www.theiphonewiki.com/wiki/Apple_TV
    
    if ([modelIdentifier isEqualToString:@"AppleTV1,1"])      return @"Apple TV 1G";
    if ([modelIdentifier isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3G"; // small, incremental update over 3,1
    if ([modelIdentifier isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4G";
    
    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }
    
    return modelIdentifier;
}

- (UIDeviceFamily) deviceFamily
{
    NSString *modelIdentifier = [self modelNameForModelIdentifier:[self modelIdentifier]];
    if ([modelIdentifier hasPrefix:@"iPhone"]) return UIDeviceFamilyiPhone;
    if ([modelIdentifier hasPrefix:@"iPod"]) return UIDeviceFamilyiPod;
    if ([modelIdentifier hasPrefix:@"iPad"]) return UIDeviceFamilyiPad;
    if ([modelIdentifier hasPrefix:@"AppleTV"]) return UIDeviceFamilyAppleTV;
    return UIDeviceFamilyUnknown;
}

- (UIDeviceGenerationModel) deviceGenerationModel
{
    NSString *modelIdentifier = [self modelIdentifier];
    
    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return UIDeviceGenerationModeliPhone3G;
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return UIDeviceGenerationModeliPhone3G;
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return UIDeviceGenerationModeliPhone3GS;
    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return UIDeviceGenerationModeliPhone4;
    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return UIDeviceGenerationModeliPhone4;
    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return UIDeviceGenerationModeliPhone4;
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return UIDeviceGenerationModeliPhone4S;
    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return UIDeviceGenerationModeliPhone5;
    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return UIDeviceGenerationModeliPhone5;
    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return UIDeviceGenerationModeliPhone5C;
    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return UIDeviceGenerationModeliPhone5C;
    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return UIDeviceGenerationModeliPhone5S;
    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return UIDeviceGenerationModeliPhone5S;
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return UIDeviceGenerationModeliPhone6Plus;
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return UIDeviceGenerationModeliPhone6;
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return UIDeviceGenerationModeliPhone6S;
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return UIDeviceGenerationModeliPhone6SPlus;
    
    // iPad http://theiphonewiki.com/wiki/IPad
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return UIDeviceGenerationModeliPad1;
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return UIDeviceGenerationModeliPad2;
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return UIDeviceGenerationModeliPad2;
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return UIDeviceGenerationModeliPad2;
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return UIDeviceGenerationModeliPad2;
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return UIDeviceGenerationModeliPad3;
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return UIDeviceGenerationModeliPad3;
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return UIDeviceGenerationModeliPad3;
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return UIDeviceGenerationModeliPad4;
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return UIDeviceGenerationModeliPad4;
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return UIDeviceGenerationModeliPad4;
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return UIDeviceGenerationModeliPadAir;
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return UIDeviceGenerationModeliPadAir;
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return UIDeviceGenerationModeliPadAir2;
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return UIDeviceGenerationModeliPadAir2;
    if ([modelIdentifier isEqualToString:@"iPad6,7"])      return UIDeviceGenerationModeliPadPro;
    if ([modelIdentifier isEqualToString:@"iPad6,8"])      return UIDeviceGenerationModeliPadPro;
    
    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return UIDeviceGenerationModeliPadMini1;
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return UIDeviceGenerationModeliPadMini1;
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return UIDeviceGenerationModeliPadMini1;
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return UIDeviceGenerationModeliPadMini2;
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return UIDeviceGenerationModeliPadMini2;
    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return UIDeviceGenerationModeliPadMini2; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return UIDeviceGenerationModeliPadMini3;
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return UIDeviceGenerationModeliPadMini3;
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return UIDeviceGenerationModeliPadMini3;
    
    // iPod http://theiphonewiki.com/wiki/IPod
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return UIDeviceGenerationModeliPod1;
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return UIDeviceGenerationModeliPod2;
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return UIDeviceGenerationModeliPod3;
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return UIDeviceGenerationModeliPod4;
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return UIDeviceGenerationModeliPod5;
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return UIDeviceGenerationModeliPod6; // as 6,1 was never released 7,1 is actually 6th generation
    
    // Apple TV https://www.theiphonewiki.com/wiki/Apple_TV
    
    if ([modelIdentifier isEqualToString:@"AppleTV1,1"])      return UIDeviceGenerationModelAppleTV1;
    if ([modelIdentifier isEqualToString:@"AppleTV2,1"])      return UIDeviceGenerationModelAppleTV2;
    if ([modelIdentifier isEqualToString:@"AppleTV3,1"])      return UIDeviceGenerationModelAppleTV3;
    if ([modelIdentifier isEqualToString:@"AppleTV3,2"])      return UIDeviceGenerationModelAppleTV3_v2; // small, incremental update over 3,1
    if ([modelIdentifier isEqualToString:@"AppleTV5,3"])      return UIDeviceGenerationModelAppleTV4;
    
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL iPhoneScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        BOOL iPadScreen = !iPhoneScreen;
        if (iPadScreen) {
            return UIDeviceGenerationModeliPadSimulator;
        }
        else {
            return UIDeviceGenerationModeliPhoneSimulator;
        }
    }
    return UIDeviceGenerationModelUnknown;
}

- (NSString*) deviceGenerationModelString
{
    NSString *modelIdentifier = [self modelIdentifier];
    
    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    // iPad http://theiphonewiki.com/wiki/IPad
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2 (Rev A)";
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    
    if ([modelIdentifier isEqualToString:@"iPad6,7"])      return @"iPad Pro (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro (Cellular)";
    
    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini 2G (Cellular)"; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3G (Cellular)";
    
    // iPod http://theiphonewiki.com/wiki/IPod
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch 6G"; // as 6,1 was never released 7,1 is actually 6th generation
    
    // Apple TV https://www.theiphonewiki.com/wiki/Apple_TV
    
    if ([modelIdentifier isEqualToString:@"AppleTV1,1"])      return @"Apple TV 1G";
    if ([modelIdentifier isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3G"; // small, incremental update over 3,1
    if ([modelIdentifier isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4G"; // as 4,1 was never released, 5,1 is actually 4th generation
    
    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }
    
    return modelIdentifier;
}

- (UIDeviceModelInches) deviceInches {
    switch ([self deviceGenerationModel]) {
        case UIDeviceGenerationModeliPhone3G:
        case UIDeviceGenerationModeliPhone3GS:
        case UIDeviceGenerationModeliPhone4:
        case UIDeviceGenerationModeliPhone4S:{
            return UIDeviceModelInches35;
        }
            break;
        case UIDeviceGenerationModeliPhone5:
        case UIDeviceGenerationModeliPhone5C:
        case UIDeviceGenerationModeliPhone5S:{
            return UIDeviceModelInches4;
        }
            break;
        case UIDeviceGenerationModeliPhone6:
        case UIDeviceGenerationModeliPhone6S:{
            return UIDeviceModelInches47;
        }
            break;
        case UIDeviceGenerationModeliPhone6Plus:
        case UIDeviceGenerationModeliPhone6SPlus:{
            return UIDeviceModelInches55;
        }
            break;
        case UIDeviceGenerationModeliPad1:
        case UIDeviceGenerationModeliPad2:
        case UIDeviceGenerationModeliPad3:
        case UIDeviceGenerationModeliPad4:
        case UIDeviceGenerationModeliPadAir:
        case UIDeviceGenerationModeliPadAir2:{
            return UIDeviceModelInches97;
        }
            break;
        case UIDeviceGenerationModeliPadMini1:
        case UIDeviceGenerationModeliPadMini2:
        case UIDeviceGenerationModeliPadMini3:
        case UIDeviceGenerationModeliPadMini4:{
            return UIDeviceModelInches79;
        }
            break;
        case UIDeviceGenerationModeliPadPro:{
            return UIDeviceModelInches129;
            break;
        }
        case UIDeviceGenerationModeliPadSimulator:
        case UIDeviceGenerationModeliPhoneSimulator:{
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            NSInteger screenHeight = ((NSInteger)screenRect.size.height > (NSInteger)screenRect.size.width) ? (NSInteger)screenRect.size.height : (NSInteger)screenRect.size.width;
            
            
            switch (screenHeight) {
                case 480:{
                    return UIDeviceSimulatorModelInches35;
                }
                    break;
                case 568:{
                    return UIDeviceSimulatorModelInches4;
                    break;
                }
                case 667:{
                    return UIDeviceSimulatorModelInches47;
                    break;
                }
                case 736:{
                    return UIDeviceSimulatorModelInches55;
                    break;
                }
                case 1024:{
                    return UIDeviceModelInches97;
                    break;
                }
                case 1366:{
                    return UIDeviceSimulatorModelInches129;
                    break;
                }
                default:{
                    return UIDeviceModelInchesUnKnown;
                    break;
                }
            }
            break;
        }
        default: {
            return UIDeviceModelInchesUnKnown;
            break;
        }
    }
    return UIDeviceModelInchesUnKnown;
}


@end
