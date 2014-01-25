//
//  PHCreatedGamesViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHCreatedGamesViewController.h"
#import "PHGame.h"
#import "PHGameCell.h"

@interface PHCreatedGamesViewController ()
@property (nonatomic, strong) NSMutableArray *createdGames;
@end

@implementation PHCreatedGamesViewController
@synthesize createdGames = _createdGames;


- (NSMutableArray *)createdGames
{
    if (!_createdGames) {
        _createdGames = [[NSMutableArray alloc] init];
    }
    
    return _createdGames;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.createdGames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PHGameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gameCell"
                                                          forIndexPath:indexPath];
    
    // Get the game at the current index
    PHGame *currGame = [self.createdGames objectAtIndex:[indexPath row]];
    
    [cell bindGame:currGame];
    
    return cell;

}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
