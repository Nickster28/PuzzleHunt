//
//  PHCreateGameInfoViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHCreateGameInfoViewController.h"
#import "PHGame.h"
#import "PHCreateGameCluesViewController.h"

@interface PHCreateGameInfoViewController ()
@end

@implementation PHCreateGameInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *offWhite = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:offWhite forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    // Fade out the placeholder text
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation setToValue:[NSNumber numberWithFloat:0.0]];
    [animation setFromValue:[NSNumber numberWithFloat:1.0]];
    [animation setDuration:0.2];
    
    [self.descriptionPlaceholderLabel.layer setOpacity:0.0];
    
    [self.descriptionPlaceholderLabel.layer addAnimation:animation
                                                  forKey:@"opacityChange"];
    
    [self.descriptionPlaceholderLabel setHidden:YES];
    
    
    return TRUE;
}



- (IBAction)cancel:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES
                                                        completion:nil];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}



- (void)textViewDidChange:(UITextView *)textView
{
    // Make sure to scroll the text view if the user gets to the bottom
    if (self.descriptionTextView.text.length > 0) {
        [textView scrollRangeToVisible:NSMakeRange(self.descriptionTextView.text.length - 1, 1)];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"makeClues"]) {
        PHGame *game = [[PHGame alloc] initWithName:[[self nameField] text]
                                        Description:[[self descriptionTextView] text]
                                              Clues:[NSMutableArray array]];
        
        PHCreateGameCluesViewController *cluesVC = [segue destinationViewController];
        
        [cluesVC setGame:game];
    }
}

@end
