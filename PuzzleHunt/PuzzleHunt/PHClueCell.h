//
//  PHClueCell.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PHClue;
@interface PHClueCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *clueNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *clueTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *clueDurationLabel;
@property (nonatomic, weak) IBOutlet UILabel *clueDescriptionLabel;


- (void)bindClue:(PHClue *)clue
          forRow:(NSUInteger)row;
@end
