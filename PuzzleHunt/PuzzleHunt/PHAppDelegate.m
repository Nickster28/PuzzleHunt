//
//  PHAppDelegate.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHAppDelegate.h"
#import <Parse/Parse.h>
NSString * const PHIsLoggedInKey = @"PHIsLoggedInKey";
NSString * const PHUserNameKey = @"PHUserNameKey";
NSString * const PHUserPhoneKey = @"PHUserPhoneKey";
NSString * const PHUserScore = @"PHUserScore";
NSString * const PHCurrentClue = @"PHCurrentClue";
NSString * const PHClueTime = @"PHClueTime";
NSString * const PHCurrentLatitude = @"PHCurrentLatitude";
NSString * const PHCurrentLongitude = @"PHCurrentLongitude";

@implementation PHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Set the initial values for the user's info
    NSDictionary *defaults = @{PHIsLoggedInKey: [NSNumber numberWithBool:NO],
                               PHUserNameKey: @"",
                               PHUserPhoneKey: @"",
                               PHUserScore: @0,
                               PHCurrentClue: @1,
                               PHClueTime: @0,
                               PHCurrentLatitude: @0,
                               PHCurrentLongitude: @0};
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:PHIsLoggedInKey]) {
        
        // Set up Parse
        [Parse setApplicationId:@"sh1737prUc7FOghj3pyY9ZllOq5ECbY5LHfRaW6i"
                      clientKey:@"G78uOxeHPxVnHujzTxgfmRbD8mCu17WnZnb9tHmN"];
        
        // Register for push notifications
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    }
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
