//
//  PHCreateGameCluesViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHCreateGameCluesViewController.h"
#import "PHClueCell.h"

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
    return self.cluesArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"addClueCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                
        return cell;
    } else {
        // Make a new Clue Cell and configure it for the clue
        static NSString *CellIdentifier = @"clueCell";
        PHClueCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        [cell bindClue:[self.cluesArray objectAtIndex:[indexPath row] - 1]
                forRow:indexPath.row - 1];
        
        return cell;
    }
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        [self.cluesArray removeObjectAtIndex:[indexPath row] - 1];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The user can't edit the "add clue" row
    if ([indexPath row] == 0) return false;
    return true;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // the user shouldn't be able to move the "add clue" row
    if ([indexPath row] == 0) return false;
    return true;
}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    // Make sure we can't move clues past the "add clue" row
    if ([proposedDestinationIndexPath row] == 0) {
        NSIndexPath *modifiedIP = [NSIndexPath indexPathForRow:1
                                                     inSection:proposedDestinationIndexPath.section];
        
        return modifiedIP;
    }
    
    return proposedDestinationIndexPath;
}



- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.cluesArray exchangeObjectAtIndex:[fromIndexPath row]
                         withObjectAtIndex:[toIndexPath row]];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0) return 44.0;
    return 100.0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // You cannot select already-made clues
    if ([indexPath row] != 0) [tableView deselectRowAtIndexPath:indexPath
                                                       animated:NO];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"addClue"]) {
        
    }
}


@end
