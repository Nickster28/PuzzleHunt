//
//  PHLoginViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHLoginViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *phoneField;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;


- (IBAction)login:(id)sender;

@end
