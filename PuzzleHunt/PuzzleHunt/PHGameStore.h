//
//  PHGameStore.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHGame, PFObject;
@interface PHGameStore : NSObject

+ (PHGameStore *)sharedStore;

- (void)uploadGame:(PHGame *)game;

- (void)fetchLiveGamesWithCompletionBlock:(void (^)(NSArray *liveGames, NSError *err))completionBlock;

- (void)fetchAllCluesWithCompletionBlock:(void (^)(NSArray *clues, NSError *err))completionBlock;


- (void)addTeamWithName:(NSString *)name toGame:(PFObject *)game;

@end
