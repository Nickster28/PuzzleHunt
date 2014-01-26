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
