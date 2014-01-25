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
extern NSString * const PHUserScore;
extern NSString * const PHCurrentClue;
extern NSString * const PHClueTime;
extern NSString * const PHCurrentLatitude;
extern NSString * const PHCurrentLongitude;

@interface PHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
