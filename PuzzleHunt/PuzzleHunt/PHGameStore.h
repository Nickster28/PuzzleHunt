//
//  PHGameStore.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHGame;
@class PHClue;
@interface PHGameStore : NSObject

+ (PHGameStore *)sharedStore;

- (void)uploadGame:(PHGame *)game;

- (void)uploadClue:(PHClue *)clue;

@end
