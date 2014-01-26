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
#import "PHClue.h"
#import "PHGameStore.h"

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
    
    UIColor *offWhite = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:offWhite forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    
    
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:99.0/255.0
                                                     green:218.0/255.0
                                                      blue:255.0/255.0
                                                     alpha:1.0];
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
