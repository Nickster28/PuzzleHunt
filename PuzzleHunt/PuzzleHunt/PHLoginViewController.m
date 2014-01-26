//
//  PHLoginViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHLoginViewController.h"
#import "PHAppDelegate.h"
#import <Parse/Parse.h>


@implementation PHLoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Sign up for keyboard notifications to shift the view so everything is still visible
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}


// Shift the view up or down with the keyboard
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGFloat kbHeight = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height / 2.0;
    NSNumber *duration = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    // Fade away
    CABasicAnimation *fader = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fader setDuration:duration.doubleValue];
    [fader setFromValue:[NSNumber numberWithFloat:1.0]];
    [fader setToValue:[NSNumber numberWithFloat:0.0]];
    
    
    // Move the name field up
    double nameCenter = self.nameField.frame.origin.y + self.nameField.frame.size.height / 2.0;
    CABasicAnimation *nameMover = [CABasicAnimation animationWithKeyPath:@"position"];
    [nameMover setDuration:duration.doubleValue];
    [nameMover setFromValue:[NSValue valueWithCGPoint:CGPointMake(160.0, nameCenter)]];
    [nameMover setToValue:[NSValue valueWithCGPoint:CGPointMake(160.0, nameCenter - kbHeight)]];
    [nameMover setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    
    // Move the phone field up
    double phoneCenter = self.phoneField.frame.origin.y + self.phoneField.frame.size.height / 2.0;
    CABasicAnimation *phoneMover = [CABasicAnimation animationWithKeyPath:@"position"];
    [phoneMover setDuration:duration.doubleValue];
    [phoneMover setFromValue:[NSValue valueWithCGPoint:CGPointMake(160.0, phoneCenter)]];
    [phoneMover setToValue:[NSValue valueWithCGPoint:CGPointMake(160.0, phoneCenter - kbHeight)]];
    [phoneMover setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    
    [self.titleLabel.layer setOpacity:0.0];
    [self.loginButton.layer setOpacity:0.0];
    [self.nameField.layer setPosition:CGPointMake(160.0, nameCenter - kbHeight)];
    [self.phoneField.layer setPosition:CGPointMake(160.0, phoneCenter - kbHeight)];
    
    [self.titleLabel.layer addAnimation:fader
                                 forKey:@"fade"];
    [self.nameField.layer addAnimation:nameMover
                                forKey:@"move"];
    [self.phoneField.layer addAnimation:phoneMover
                                 forKey:@"phoneMove"];
    [self.loginButton.layer addAnimation:fader
                                  forKey:@"fadeLogin"];
}


- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGFloat kbHeight = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height / 2.0;
    NSNumber *duration = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    // Fade away
    CABasicAnimation *fader = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fader setDuration:duration.doubleValue];
    [fader setFromValue:[NSNumber numberWithFloat:0.0]];
    [fader setToValue:[NSNumber numberWithFloat:1.0]];
    
    
    // Move the name field down
    double nameCenter = self.nameField.frame.origin.y + self.nameField.frame.size.height / 2.0;
    CABasicAnimation *nameMover = [CABasicAnimation animationWithKeyPath:@"position"];
    [nameMover setDuration:duration.doubleValue];
    [nameMover setFromValue:[NSValue valueWithCGPoint:CGPointMake(160.0, nameCenter)]];
    [nameMover setToValue:[NSValue valueWithCGPoint:CGPointMake(160.0, nameCenter + kbHeight)]];
    [nameMover setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    
    // Move the phone field down
    double phoneCenter = self.phoneField.frame.origin.y + self.phoneField.frame.size.height / 2.0;
    CABasicAnimation *phoneMover = [CABasicAnimation animationWithKeyPath:@"position"];
    [phoneMover setDuration:duration.doubleValue];
    [phoneMover setFromValue:[NSValue valueWithCGPoint:CGPointMake(160.0, phoneCenter)]];
    [phoneMover setToValue:[NSValue valueWithCGPoint:CGPointMake(160.0, phoneCenter + kbHeight)]];
    [phoneMover setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    
    [self.titleLabel.layer setOpacity:1.0];
    [self.loginButton.layer setOpacity:1.0];
    [self.nameField.layer setPosition:CGPointMake(160.0, nameCenter + kbHeight)];
    [self.phoneField.layer setPosition:CGPointMake(160.0, phoneCenter + kbHeight)];
    
    [self.titleLabel.layer addAnimation:fader
                                 forKey:@"fade"];
    [self.nameField.layer addAnimation:nameMover
                                forKey:@"move"];
    [self.phoneField.layer addAnimation:phoneMover
                                 forKey:@"phoneMove"];
    [self.loginButton.layer addAnimation:fader
                                  forKey:@"fadeLogin"];

}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)login:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:[[self nameField] text]
                                              forKey:PHUserNameKey];
    [[NSUserDefaults standardUserDefaults] setObject:[[self phoneField] text]
                                              forKey:PHUserPhoneKey];
    [[NSUserDefaults standardUserDefaults] setBool:YES
                                            forKey:PHIsLoggedInKey];
    
    
    // Set up Parse
    [Parse setApplicationId:@"sh1737prUc7FOghj3pyY9ZllOq5ECbY5LHfRaW6i"
                  clientKey:@"G78uOxeHPxVnHujzTxgfmRbD8mCu17WnZnb9tHmN"];
    
    // Register for push notifications
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES
                                                        completion:nil];
}

@end
