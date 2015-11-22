//
//  UIDevice-UtisViewController.m
//  UIDevice-Utils
//
//  Created by Giuseppe Nucifora on 11/09/2015.
//  Copyright (c) 2015 Giuseppe Nucifora. All rights reserved.
//

#import "UIDeviceUtisViewController.h"
#import "UIDevice-Hardware.h"

@interface UIDeviceUtisViewController ()

@end

@implementation UIDeviceUtisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    switch ([[UIDevice currentDevice] deviceFamily]) {
        case UIDeviceFamilyiPhone: {
            NSLog(@"Device family iPhone");
            break;
        }
        case UIDeviceFamilyiPod: {
            NSLog(@"Device family iPod");
            break;
        }
        case UIDeviceFamilyiPad: {
            NSLog(@"Device family iPad");
            break;
        }
        case UIDeviceFamilyAppleTV: {
            NSLog(@"Device family Apple TV");
            break;
        }
        case UIDeviceFamilyUnknown: {
            NSLog(@"Device family unknown");
            break;
        }
        default: {
            break;
        }
    }
    
    switch ([[UIDevice currentDevice] deviceInches]) {
        case UIDeviceModelInches35: {
            NSLog(@"Device inches 3.5");
            break;
        }
        case UIDeviceModelInches4: {
            NSLog(@"Device inches 4");
            break;
        }
        case UIDeviceModelInches47: {
            NSLog(@"Device inches 4.7");
            break;
        }
        case UIDeviceModelInches55: {
            NSLog(@"Device inches 5.5");
            break;
        }
        case UIDeviceModelInches79: {
            NSLog(@"Device inches 7.9");
            break;
        }
        case UIDeviceModelInches97: {
            NSLog(@"Device inches 9.7");
            break;
        }
        case UIDeviceModelInches129: {
            NSLog(@"Device inches 12.9");
            break;
        }
        case UIDeviceModelInchesUnKnown: {
            NSLog(@"Device inches unknown");
            break;
        }
        default: {
            break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
