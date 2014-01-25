//
//  PHGame.m
//  PuzzleHunt
//
//  Created by Kristen Pownell on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHGame.h"

@implementation PHGame

- (id)initWithName:(NSString *)name Description:(NSString *)description Clues:(NSMutableArray *)clues {
    self = [super init];
    if(self) {
        [self setGameName:name];
        [self setGameDescription:description];
        [self setGameClues:clues];
    }
    return self;
}

- (id)init {
    return [self initWithName:@"Game" Description:@"" Clues:@[]];
}

- (void)addGameClues:(PHClue *)clue {
    [[self gameClues] addObject:clue];
}


@end
