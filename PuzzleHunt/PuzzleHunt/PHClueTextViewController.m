//
//  PHClueTextViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/26/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHClueTextViewController.h"

@interface PHClueTextViewController ()
@property (nonatomic, weak) IBOutlet UITextView *textView;
@end

@implementation PHClueTextViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.textView setText:self.text];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.delegate userEnteredClueWithText:[self.textView text]];
}

@end
