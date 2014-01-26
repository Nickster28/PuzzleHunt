//
//  PHClueHintViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/26/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHCreateClueViewController.h"

@interface PHClueHintViewController : UIViewController
@property (nonatomic, weak) id <ClueHintDelegate> delegate;
@property (nonatomic, strong) NSString *text;
@end

