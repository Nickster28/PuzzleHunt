//
//  PHPlayerViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/26/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFObject;
@interface PHPlayerViewController : UIViewController
@property (nonatomic, strong) PFObject *currGame;
@property (nonatomic, strong) NSString *teamName;
@end
