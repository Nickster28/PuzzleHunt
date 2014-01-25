//
//  PHGame.h
//  PuzzleHunt
//
//  Created by Kristen Pownell on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PHClue.h"

@interface PHGame : NSObject

@property (nonatomic,strong) NSString *gameName;
@property (nonatomic,strong) NSString *gameDescription;
@property (nonatomic,strong) NSMutableArray *gameClues;

- (id)initWithName:(NSString *)name Description:(NSString *)description Clues:(NSMutableArray *)clues;

- (void)addClue:(PHClue *)clue;

@end
