//
//  PHGameStore.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHGameStore.h"
#import "PHGame.h"
#import <Parse/Parse.h>

@implementation PHGameStore


+ (PHGameStore *)sharedStore
{
    static PHGameStore *sharedStore;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[PHGameStore alloc] init];
    });
    
    return sharedStore;
}

- (PFObject *)createPFObjectFromClue:(PHClue *)clue {
    PFObject *pfClue = [PFObject objectWithClassName:@"Clue"];
    pfClue[@"clueName"] = [clue clueName];
    pfClue[@"clueText"] = [clue clueDescription];
    pfClue[@"hints"] = [clue hints];
    pfClue[@"duration"] = [[NSNumber alloc] initWithInteger:[clue time]];
    pfClue[@"location"] = [PFGeoPoint geoPointWithLatitude:[clue latitude].doubleValue
                                                 longitude:[clue longitude].doubleValue];
    
    return pfClue;
}

- (void)uploadGame:(PHGame *)game {
    NSMutableArray *pfClueMutableArray = [[NSMutableArray alloc]init];
    for (PHClue *clue in [game gameClues]) {
        [pfClueMutableArray addObject:[self createPFObjectFromClue:clue]];
    }
    
    PFObject *pfGame = [PFObject objectWithClassName:@"Game"];
    pfGame[@"gameName"] = [game gameName];
    pfGame[@"clues"] = pfClueMutableArray;
    pfGame[@"gameDescription"] = [game gameDescription];
    pfGame[@"totalTime"] = [[NSNumber alloc] initWithInteger:[game totalTime]];
    
    [pfGame saveInBackground];
}

- (void)fetchLiveGamesWithCompletionBlock:(void (^)(NSArray *liveGames, NSError *err))completionBlock {
    PFQuery *query = [PFQuery queryWithClassName:@"Game"];
    [query findObjectsInBackgroundWithBlock:completionBlock];
}

@end
