//
//  PHClueLibraryViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHClueLibraryViewController.h"
#import "PHGameStore.h"

@interface PHClueLibraryViewController ()
@property (nonatomic, strong) NSArray *clues;
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
        [self setClues:clues];
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


@end
