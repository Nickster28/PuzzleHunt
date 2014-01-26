//
//  PHClueLibraryViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHCreateGameCluesViewController.h"

@interface PHClueLibraryViewController : UITableViewController
@property (nonatomic, weak) id <ClueCreatorDelegate> clueDelegate;
@end