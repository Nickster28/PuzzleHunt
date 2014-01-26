//
//  PHAppDelegate.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//  Kristen Pownell, Nick Troccoli, Bharad Raghavan, Avi Bagla

#import <UIKit/UIKit.h>

extern NSString * const PHIsLoggedInKey;
extern NSString * const PHUserNameKey;
extern NSString * const PHUserPhoneKey;
extern NSString * const PHUserScore;
extern NSString * const PHCurrentClue;
extern NSString * const PHClueTime;
extern NSString * const PHCurrentLatitude;
extern NSString * const PHCurrentLongitude;
extern NSString * const PHIsModerator;

extern NSString * const PuzzleHuntNotificationTypeModerator;
extern NSString * const PuzzleHuntNotificationTypeStart;
extern NSString * const PuzzleHuntNotificationTypeRank;
extern NSString * const PuzzleHuntNotificationTypeLocation;
extern NSString * const PuzzleHuntNotificationTypeKey;

extern NSString * const PuzzleHuntRankNotification;
extern NSString * const PuzzleHuntLocationNotification;
extern NSString * const PuzzleHuntStartNotification;

@interface PHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
