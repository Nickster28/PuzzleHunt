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
    NSMutableArray *emptyArray = [[NSMutableArray alloc] init];
    return [self initWithName:@"Game" Description:@"" Clues:emptyArray];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        [self setGameName:[aDecoder decodeObjectForKey:@"gameName"]];
        [self setGameDescription:[aDecoder decodeObjectForKey:@"gameDescription"]];
        [self setGameClues:[aDecoder decodeObjectForKey:@"gameClues"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_gameName forKey:@"gameName"];
    [aCoder encodeObject:_gameDescription forKey:@"gameDescription"];
    [aCoder encodeObject:_gameClues forKey:@"gameClues"];
}

- (void)addClue:(PHClue *)clue {
    [[self gameClues] addObject:clue];
}


@end
