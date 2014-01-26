//
//  PHJoinGameListController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <Parse/Parse.h>
#import "PHJoinGameListController.h"
#import "PHGameStore.h"

@interface PHJoinGameListController ()

// keys are individual letters (upper case)
// values are arrays of games with names starting with that letter
@property (nonatomic, strong) NSMutableDictionary *gameSections;
@end

@implementation PHJoinGameListController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *offWhite = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:offWhite forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    
    // Change the background to blue
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:99.0/255.0
                                                     green:218.0/255.0
                                                      blue:255.0/255.0
                                                     alpha:1.0];
    
    
    // Fetch the current live games
    [[PHGameStore sharedStore] fetchLiveGamesWithCompletionBlock:^(NSArray *liveGames, NSError *err) {
        if (err) {
            NSLog(@"Live fetching of games didn't work");
        } else {
            [self convertArrayToDictionary:liveGames];
        }
    }];
}


- (void)convertArrayToDictionary:(NSArray *)games
{
    // Loop through the array of games, sorting them into dictionary
    // buckets (arrays) by the first letter of their name
    [self setGameSections:[[NSMutableDictionary alloc] init]];
    for(PFObject *game in games) {
        NSString *firstGameLetter = [[[game valueForKey:@"gameName"] substringToIndex:1] uppercaseString];
        NSMutableArray *currSectionGames = [[self gameSections] objectForKey:firstGameLetter];
        if(!currSectionGames) {
            currSectionGames = [[NSMutableArray alloc] init];
        }
        [currSectionGames addObject:game];
        [[self gameSections] setValue:currSectionGames forKey:firstGameLetter];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[self gameSections] allKeys] count];
}

//Section is a number, but our dictionary keys are letters
//Find the alphabetic key that corresponds to the section number
//Helper method for numRowsInSection and titleForHeaderInSection
- (NSString *)getKeyForSection:(NSInteger)section
{
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return [alphabet substringWithRange:NSMakeRange(section, 1)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self gameSections] valueForKey:[self getKeyForSection:section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self getKeyForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"gameNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // [[cell textLabel] setText...]
    
    return cell;
}

@end
