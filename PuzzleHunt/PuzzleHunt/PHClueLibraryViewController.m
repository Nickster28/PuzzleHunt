//
//  PHClueLibraryViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHClueLibraryViewController.h"
#import "PHGameStore.h"
#import "PHClueCell.h"
#import "PHClue.h"
#import <Parse/Parse.h>
#import "PHCreateClueViewController.h"

@interface PHClueLibraryViewController ()
@property (nonatomic, strong) NSMutableArray *clues;
@end

@implementation PHClueLibraryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIColor *offWhite = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:offWhite forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
        
    // Set the table background to blue
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:99.0/255.0
                                                     green:218.0/255.0
                                                      blue:255.0/255.0
                                                     alpha:1.0];
    
    
    
    [[PHGameStore sharedStore] fetchAllCluesWithCompletionBlock:^(NSArray *clues, NSError *err) {
        
        [self setClues:[NSMutableArray array]];
        
        // Translate each clue into a PHClue
        for (PFObject *obj in clues) {
            NSNumber *lat = [NSNumber numberWithDouble:[(PFGeoPoint *)[obj objectForKey:@"location"] latitude]];
            NSNumber *lon = [NSNumber numberWithDouble:[(PFGeoPoint *)[obj objectForKey:@"location"] longitude]];
            NSUInteger time = [(NSNumber *)[obj objectForKey:@"duration"] integerValue];
            
            PHClue *clue = [[PHClue alloc] initWithName:[obj objectForKey:@"clueName"]
                                            Description:[obj objectForKey:@"clueText"]
                                               Latitude:lat
                                              Longitude:lon
                                                   Time:time
                                                  Hints:[obj objectForKey:@"hints"]];
            
            [self.clues addObject:clue];
        }
        
        
        [self.tableView reloadData];
    }];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.clues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"clueCell";
    PHClueCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PHClue *clue = [self.clues objectAtIndex:[indexPath row]];
    
    
    [cell bindClue:clue
            forRow:[indexPath row]];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editClue"]) {
        PHCreateClueViewController *createVC = [segue destinationViewController];
        
        PHClueCell *tappedCell = sender;
        NSIndexPath *ip = [self.tableView indexPathForCell:tappedCell];
        
        [createVC setClue:[self.clues objectAtIndex:[ip row]]];
        [createVC setClueDelegate:self.clueDelegate];
    }
}


@end
