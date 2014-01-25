//
//  PHBeginGameViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHBeginGameViewController.h"
#import "PHGame.h"

@interface PHBeginGameViewController ()

@end

@implementation PHBeginGameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationItem setTitle:[self.game gameName]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)beginGame:(id)sender
{
    
}

@end
