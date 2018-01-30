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

#import "UIDevice-Hardware.h"

FOUNDATION_EXPORT double UIDevice_UtilsVersionNumber;
FOUNDATION_EXPORT const unsigned char UIDevice_UtilsVersionString[];

