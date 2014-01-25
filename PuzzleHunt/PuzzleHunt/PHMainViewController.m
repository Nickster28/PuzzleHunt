//
//  PHMainViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHMainViewController.h"
#import "PHAppDelegate.h"
#import "PHLoginViewController.h"


@implementation PHMainViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    NSString *helloString = [NSString stringWithFormat:@"Hello, %@!", [[NSUserDefaults standardUserDefaults] stringForKey:PHUserNameKey]];
    
    NSUInteger spaceIndex = [helloString rangeOfString:@" " options:NSBackwardsSearch].location;
    
    [self.helloLabel setText:[[helloString substringToIndex:spaceIndex] stringByAppendingString: @"!"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:PHIsLoggedInKey]) {
        
        [self.helloLabel setText:@"Hello!"];
        
        // Delay the modal popup
        double delayInSeconds = 0.7;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            PHLoginViewController *loginVC = [[PHLoginViewController alloc] init];
            [self presentViewController:loginVC
                               animated:YES
                             completion:nil];
        });
    }
}


@end
