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
    /*PFQuery *query = [PFQuery queryWithClassName:@"Game"];
    [query orderByAscending:@"gameName"];
    [query findObjectsInBackgroundWithBlock:completionBlock];*/
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSArray *names = @[@"Nick", @"Kristen", @"Bharad", @"Avi"];
    
    for (int i = 0; i < 4; i++) {
        PHGame *game = [[PHGame alloc] initWithName:[names objectAtIndex:i]
                                        Description:@"This is a puzzlehunt game for the ages!"
                                              Clues:nil];
        
        [array addObject:game];
    }
    
    completionBlock(array, nil);
}

@end
