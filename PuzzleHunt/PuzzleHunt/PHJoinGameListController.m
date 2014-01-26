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
    
    self.navigationController.navigationBarHidden = NO;
    
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
            [self.tableView reloadData];
        }
    }];
}


- (void)convertArrayToDictionary:(NSArray *)games
{
    // Loop through the array of games, sorting them into dictionary
    // buckets (arrays) by the first letter of their name
    [self setGameSections:[[NSMutableDictionary alloc] init]];
    
    
    //Add all games to appropriate bucket
    for(PFObject *game in games) {
        NSString *firstGameLetter = [[[game valueForKey:@"gameName"] substringToIndex:1] uppercaseString];
        NSMutableArray *currSectionGames = [[self gameSections] objectForKey:firstGameLetter];
        //If no bucket exists, create one
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
//Find the alphabetic key that corresponds to the section number, given that not all numbers exist
//Create ordered array of all keys and look up correct key by index
- (NSString *)getKeyForSection:(NSInteger)section
{
    NSArray *orderedKeys = [[[self gameSections] allKeys] sortedArrayUsingSelector:@selector(compare:)];
    return [orderedKeys objectAtIndex: section];
}

//Reverse method of above; sorts all keys and searches for index of specified keys
- (NSInteger)getSectionForKey:(NSString *)key
{
    NSArray *orderedKeys = [[[self gameSections] allKeys] sortedArrayUsingSelector:@selector(compare:)];
    return [orderedKeys indexOfObject:key];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self gameSections] valueForKey:[self getKeyForSection:section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self getKeyForSection:section];
}

//Configure values of each cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"gameNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSMutableArray *currGames = [[self gameSections]valueForKey:[self getKeyForSection:[indexPath section]]];
    
    [[cell textLabel] setText: [[currGames objectAtIndex:[indexPath row]] valueForKey:@"gameName"]];
    
    return cell;
}

//Array of titles to display for index on the side
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSString *alphabet = @"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z";
    return [alphabet componentsSeparatedByString:@" "];
}

//Return the section index based on the index in the side scroll (should be identical)
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    NSArray *alphabet = [@"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" componentsSeparatedByString:@" "];
    
    NSInteger currIndex = [self getSectionForKey:title];
    NSInteger alphaIndex = index;
    
    //If current letter isn't contained in our dictionary, go up and then down until you find a letter that is defined
    while(alphaIndex > 0 && currIndex == NSNotFound) {
        alphaIndex--;
        currIndex = [self getSectionForKey:[alphabet objectAtIndex:alphaIndex]];
    }
    alphaIndex = index;
    while(alphaIndex < [[[self gameSections] allKeys] count] - 1) {
        alphaIndex++;
        currIndex = [self getSectionForKey:[alphabet objectAtIndex:alphaIndex]];
    }
    if([self getSectionForKey:[alphabet objectAtIndex:alphaIndex-1]] == NSNotFound) {
        return 0;
    }
    return alphaIndex;
}

@end
