//
//  PHCreateClueViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHCreateClueViewController.h"
#import "PHClueTextCell.h"
#import "PHClueLocationViewController.h"
#import "PHClue.h"


@interface PHCreateClueViewController ()
@end

@implementation PHCreateClueViewController


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
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0) {
        PHClueTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
        
        [[cell titleLabel] setText:@"Name: "];
        [[cell textField] setText:[self.clue clueName]];
        return cell;
    
    } else if ([indexPath row] == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
        
        [[cell textLabel] setText:@"Clue Text"];
        return cell;
    
    } else if ([indexPath row] == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
        
        [[cell textLabel] setText:@"Location"];
        return cell;
    } else if ([indexPath row] == 3) {
        PHClueTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
        
        [[cell titleLabel] setText:@"Time (min): "];
        [[cell textField] setText:[NSString stringWithFormat:@"%i", self.clue.time]];
        return cell;
        
    } else if ([indexPath row] == 4) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
        
        [[cell textLabel] setText:@"Hints"];
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 1) {
        
    } else if ([indexPath row] == 2) {
        [self performSegueWithIdentifier:@"setLocation" sender:self];
    } else if ([indexPath row] == 4) {
        
    }
}


- (void)userChoseLocationWithLat:(NSNumber *)latitude longitude:(NSNumber *)longitude
{
    [self.clue setLatitude:latitude];
    [self.clue setLongitude:longitude];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"setLocation"]) {
        PHClueLocationViewController *locationVC = [segue destinationViewController];
        
        [locationVC setDelegate:self];
    }
}

@end
