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
#import "PHClueTextViewController.h"
#import "PHClueHintViewController.h"


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
        [self performSegueWithIdentifier:@"setText" sender:self];
    } else if ([indexPath row] == 2) {
        [self performSegueWithIdentifier:@"setLocation" sender:self];
    } else if ([indexPath row] == 4) {
        [self performSegueWithIdentifier:@"setHint" sender:self];
    }
}


- (void)userChoseLocationWithLat:(NSNumber *)latitude longitude:(NSNumber *)longitude
{
    [self.clue setLatitude:latitude];
    [self.clue setLongitude:longitude];
}


- (void)userEnteredClueWithText:(NSString *)text
{
    [self.clue setClueDescription:text];
}


- (void)userEnteredHint:(NSString *)text
{
    [self.clue setHints:[NSArray arrayWithObject:text]];
}


- (IBAction)saveClue:(id)sender
{
    PHClueTextCell *nameCell = (PHClueTextCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    PHClueTextCell *timeCell = (PHClueTextCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    
    NSString *title = [[nameCell textField] text];
    NSUInteger time = [[[timeCell textField] text] integerValue];
    [self.clue setClueName:title];
    [self.clue setTime:time];
    [self.clueDelegate clueCreated:self.clue];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"setLocation"]) {
        PHClueLocationViewController *locationVC = [segue destinationViewController];
        
        [locationVC setDelegate:self];
    } else if ([[segue identifier] isEqualToString:@"setText"]) {
        PHClueTextViewController *textVC = [segue destinationViewController];
        
        [textVC setDelegate:self];
        [textVC setText:[self.clue clueDescription]];
    } else if ([[segue identifier] isEqualToString:@"setHint"]) {
        PHClueHintViewController *hintVC = [segue destinationViewController];
        
        [hintVC setDelegate:self];
        if (self.clue.hints.count > 0) {
            [hintVC setText:[[self.clue hints] objectAtIndex:0]];
        }
    }
}

@end
