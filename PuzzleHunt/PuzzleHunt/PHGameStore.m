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
    
    NSNumber *clueTime = [[NSNumber alloc] initWithInteger:[clue time]];
    pfClue[@"duration"] = clueTime;

    PFGeoPoint *loc = [PFGeoPoint geoPointWithLatitude:[clue latitude].doubleValue
                                             longitude:[clue longitude].doubleValue];
    pfClue[@"location"] = loc;
    
    return pfClue;
}

- (void)uploadGame:(PHGame *)game
{
    

    
}

//gameName, teams, clues

/*@property (nonatomic,strong) NSString *gameName;
@property (nonatomic,strong) NSString *gameDescription;
@property (nonatomic,strong) NSMutableArray *gameClues;
@property (nonatomic) NSUInteger totalTime;*/

@end
