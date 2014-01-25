//
//  PHAppDelegate.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const PHIsLoggedInKey;
extern NSString * const PHUserNameKey;
extern NSString * const PHUserPhoneKey;

@interface PHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
