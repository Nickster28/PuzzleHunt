//
//  PHCreateClueViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHCreateGameCluesViewController.h"

@class PHClue;
@interface PHCreateClueViewController : UITableViewController
@property (nonatomic, weak) id <ClueCreatorDelegate> clueDelegate;
@property (nonatomic, strong) PHClue *clue;
@end
