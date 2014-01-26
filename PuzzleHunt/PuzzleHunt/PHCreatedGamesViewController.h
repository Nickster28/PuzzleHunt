//
//  PHCreatedGamesViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHGame.h"

@protocol GamesCollectorDelegate <NSObject>

- (void)userCreatedGame:(PHGame *)game;

@end


@interface PHCreatedGamesViewController : UITableViewController <GamesCollectorDelegate>

@end
