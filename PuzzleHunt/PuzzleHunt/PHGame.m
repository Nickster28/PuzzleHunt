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
        
        NSUInteger totalMin = 0;
        
        for (PHClue *currClue in [self gameClues]) {
            totalMin += [currClue time];
        }
        
        [self setTotalTime:totalMin];
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
        [self setTotalTime:[aDecoder decodeIntegerForKey:@"totalTime"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_gameName forKey:@"gameName"];
    [aCoder encodeObject:_gameDescription forKey:@"gameDescription"];
    [aCoder encodeObject:_gameClues forKey:@"gameClues"];
    [aCoder encodeInteger:_totalTime forKey:@"totalTime"];
}

- (void)addClue:(PHClue *)clue {
    [[self gameClues] addObject:clue];
    
    [self setTotalTime:[self totalTime] + [clue time]];
}


@end
