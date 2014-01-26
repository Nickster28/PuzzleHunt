//
//  PHCreateClueViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHCreateGameCluesViewController.h"


@protocol LocationFinderDelegate <NSObject>

- (void)userChoseLocationWithLat:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end


@protocol ClueDescriptionDelegate <NSObject>

- (void)userEnteredClueWithText:(NSString *)text;

@end


@class PHClue;
@interface PHCreateClueViewController : UITableViewController <LocationFinderDelegate, ClueDescriptionDelegate>
@property (nonatomic, weak) id <ClueCreatorDelegate> clueDelegate;
@property (nonatomic, strong) PHClue *clue;
@end
