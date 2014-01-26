//
//  PHCreateGameCluesViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHCreatedGamesViewController.h"

@class PHGame, PHClue;

@protocol ClueCreatorDelegate <NSObject>

- (void)clueCreated:(PHClue *)clue;

@end

@interface PHCreateGameCluesViewController : UITableViewController <UIActionSheetDelegate, ClueCreatorDelegate>
@property (nonatomic, strong) PHGame *game;
@property (nonatomic, weak) id <GamesCollectorDelegate> delegate;
@end



