//
//  PHMainViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHMainViewController.h"
#import "PHAppDelegate.h"

@interface PHMainViewController ()

@end

@implementation PHMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:PHIsLoggedInKey]) {
        [self performSegueWithIdentifier:@"showLoginScreen" sender:self];
    }
}


@end
