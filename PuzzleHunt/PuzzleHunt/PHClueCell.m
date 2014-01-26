//
//  PHClueCell.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHClueCell.h"
#import "PHClue.h"

@implementation PHClueCell


- (void)bindClue:(PHClue *)clue
          forRow:(NSUInteger)row
{
    [self.clueNumberLabel setText:[NSString stringWithFormat:@"Clue %i", row + 1]];
    [self.clueTitleLabel setText:[clue clueName]];
    [self.clueDurationLabel setText:[NSString stringWithFormat:@"EST: %i:00", [clue time]]];
    [self.clueDescriptionLabel setText:[clue clueDescription]];
}

@end
