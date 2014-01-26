//
//  PHModeratorViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/26/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHModeratorViewController.h"
#import "PHGameStore.h"
#import <Parse/Parse.h>
#import "PHRankTeamCell.h"
#import "PHMapPoint.h"
#import "PHAppDelegate.h"

@interface PHModeratorViewController ()
@property (nonatomic, strong) NSArray *teams;
@end

@implementation PHModeratorViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIColor *offWhite = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:offWhite forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    
    
    [self rankingTableView].backgroundView = nil;
    [self rankingTableView].backgroundColor = [UIColor colorWithRed:99.0/255.0
                                                     green:218.0/255.0
                                                      blue:255.0/255.0
                                                     alpha:1.0];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateTeams:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateTeams:)
                                                 name:PuzzleHuntLocationNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateTeams:)
                                                 name:PuzzleHuntRankNotification
                                               object:nil];
}


- (void)updateTeams:(NSNotification *)note
{
    [[PHGameStore sharedStore] fetchTeamsByRankWithCompletionBlock:^(NSArray *teams, NSError *err) {
        [self setTeams:teams];
        [[self rankingTableView] reloadData];
        [self setUpMapView];
    }];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PHRankTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    
    PFObject *team = [self.teams objectAtIndex:[indexPath row]];
    
    [[cell nameLabel] setText:[team objectForKey:@"teamName"]];
    [[cell scoreLabel] setText:[NSString stringWithFormat:@"%i", [[team objectForKey:@"score"] integerValue]]];
    [[cell clueLabel] setText:[NSString stringWithFormat:@"Clue %i", [[team objectForKey:@"currentClueNum"] integerValue]]];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.teams.count;
}


- (void)setUpMapView
{
    for (PFObject *object in self.teams) {
        PFGeoPoint *point = [object objectForKey:@"currLocation"];
        NSNumber *latitude = [NSNumber numberWithFloat:[point latitude]];
        NSNumber *longitude = [NSNumber numberWithFloat:[point longitude]];
        PHMapPoint *pin = [[PHMapPoint alloc] initWithLatitude:latitude Longitude:longitude Team:[object objectForKey:@"teamName"]];
        [[self rankingMapView] addAnnotation:pin];
    }
}

@end
