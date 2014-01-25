//
//  PHGameCell.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHGameCell.h"
#import "PHGame.h"

@implementation PHGameCell

- (void)bindGame:(PHGame *)game
{
    [[self titleLabel] setText:[game gameName]];
    
    NSUInteger numClues = [[game gameClues] count];
    [[self numCluesLabel] setText:[NSString stringWithFormat:@"%i Clues", numClues]];
    [[self durationLabel] setText:[NSString stringWithFormat:@"Time: %i min", [game totalTime]]];
    [[self descriptionLabel] setText:[game gameDescription]];
}

@end
