//
//  PHCreateGameInfoViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHCreateGameInfoViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UILabel *descriptionPlaceholderLabel;
@property (nonatomic, weak) IBOutlet UITextView *descriptionTextView;

- (IBAction)cancel:(id)sender;

@end
