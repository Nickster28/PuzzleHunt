//
//  PHCreateGameCluesViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHCreateGameCluesViewController.h"

@interface PHCreateGameCluesViewController ()
@property (nonatomic, strong) NSMutableArray *cluesArray;
@end

@implementation PHCreateGameCluesViewController
@synthesize cluesArray = _cluesArray;


- (NSMutableArray *)cluesArray
{
    if (!_cluesArray) {
        _cluesArray = [[NSMutableArray alloc] init];
    }
    
    return _cluesArray;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *offWhite = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:offWhite forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    
    [self.navigationItem setRightBarButtonItem:[self editButtonItem]];
}


#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cluesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.cluesArray removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}




- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.cluesArray exchangeObjectAtIndex:[fromIndexPath row]
                         withObjectAtIndex:[toIndexPath row]];
}


@end
