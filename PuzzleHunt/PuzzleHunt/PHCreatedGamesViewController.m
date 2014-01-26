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
#import "PHCreateGameInfoViewController.h"

@interface PHCreatedGamesViewController ()
@property (nonatomic, strong) NSMutableArray *createdGames;
@end

@implementation PHCreatedGamesViewController
@synthesize createdGames = _createdGames;


- (NSMutableArray *)createdGames
{
    if (!_createdGames) {
        _createdGames = [[NSMutableArray alloc] init];
        
        NSArray *fakeClueNames = [[NSArray alloc] initWithObjects:@"Here There Be Monsters",@"The Lion Returns",@"Waterworks",@"Sirens",@"Ahoy!",@"Imperialistic Ideals",@"Ancient Halls",@"A Small Tribute",@"Origin Story",@"Yellow Journalism", nil];
        NSArray *fakeClueDescriptions = [[NSArray alloc] initWithObjects:@"Check under the bed for the answer to this",@"Lucy went to Narnia through this device",@"The ocean's too large, a river's too small. This is right in-between",@"In case of emergency, please call __.",@"Avast, ye mateys! The loot be buried at this pirate-y spot.",@"The British East India Company had a roaring trade in ____. Where is this sold today?",@"Oldest university in America",@"Where did you buy this device?",@"Site of 36-hour hacktech in 2014",@"Zebras can be found at this strange historic mansion.", nil];
        NSArray *fakeLatitude = [[NSArray alloc] initWithObjects: @30.0, @40.0, @50.1, @32.3, @39.7, @45.0, @42.35, @43.7, @34.0, @38.3,nil];
        NSArray *fakeLongitude = [[NSArray alloc] initWithObjects: @20.3, @19.7, @15.4, @18.5, @13.0, @12.7, @14.9, @17.3, @18.3, @11.0,nil];
        NSArray *fakeTime = [[NSArray alloc] initWithObjects: @15,@20,@25,@10,@15,@15,@35,@10,@20,@30,nil];
        NSArray *fakeHints = [[NSArray alloc] initWithObjects: @"Think monsters.", @"Author is C.S. Lewis for googling purposes.",@"There's a black and red one of these.",@"What department helps with arson?",@"Go to the ocean. It's easy to find.",@"Not coffee but...",@"Google it.",@"This is an Apple product, right?",@"You should know this one!",@"Halfway between LA and SF",nil];
        NSMutableArray *fakeClues = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; i++) {
            PHClue *fakeClue = [[PHClue alloc] initWithName:[fakeClueNames objectAtIndex:i] Description:[fakeClueDescriptions objectAtIndex:i] Latitude:[fakeLatitude objectAtIndex:i] Longitude:[fakeLongitude objectAtIndex:i] Time:[[fakeTime objectAtIndex:i] intValue] Hints:[fakeHints objectAtIndex:i]];
            [fakeClues addObject:fakeClue];
        }
        
        
        NSArray *fakeGameNames = [[NSArray alloc] initWithObjects:@"Best game ever",@"The pirate game",@"Our game",@"The game",@"Shakespeare's Sorrow",@"Blackbeard's Burden",@"Over the River and Through the Woods",@"To Infinity And Beyond",@"The Heist",@"Mystery and Mayhem", nil];
        NSArray *fakeGameDescriptions = [[NSArray alloc] initWithObjects:@"For Jenny's birthday!",@"Avast, ye mateys! Ready your ships to find the loot!",@"Built for a rainy day. Built to last.",@"The one. The only. The original game!",@"Why did the bard never smile? Find out with these brand-new clues!",@"The mystery of the world's most famous pirate!",@"To grandmother's house we go...",@"Blast-off in three...two...one...GO!",@"Palantir's Yearly Puzzle Hunt",@"A whodunit with a modern twist.",nil];
        NSArray *fakeGameClueIndices = [[NSArray alloc] initWithObjects:[[NSArray alloc] initWithObjects:@0,@1,@2,nil],[[NSArray alloc] initWithObjects:@2,@3,@4,nil],[[NSArray alloc] initWithObjects:@5,@2,@1,nil],[[NSArray alloc] initWithObjects:@4,@3,@0,nil],[[NSArray alloc] initWithObjects:@8,@7,@9,nil],[[NSArray alloc] initWithObjects:@2,@9,@1,nil],[[NSArray alloc] initWithObjects:@0,@4,@7,nil],[[NSArray alloc] initWithObjects:@7,@1,@2,nil],[[NSArray alloc] initWithObjects:@8,@0,@2,nil],[[NSArray alloc] initWithObjects:@5,@6,@3,nil], nil];
        
        for(int j = 0; j < 10; j++) {
            NSMutableArray *currClues = [[NSMutableArray alloc] init];
            for(int k = 0; k < 3; k++) {
                [currClues addObject:[fakeClues objectAtIndex:[[[fakeGameClueIndices objectAtIndex:j] objectAtIndex:k] intValue]]];
            }
            PHGame *currGame = [[PHGame alloc] initWithName:[fakeGameNames objectAtIndex:j] Description:[fakeGameDescriptions objectAtIndex:j] Clues:currClues];
            [_createdGames addObject:currGame];
        }
        
    }
    
    return _createdGames;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
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


- (void)userCreatedGame:(PHGame *)game
{
    [[self createdGames] addObject:game];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"createGame"]) {
        PHCreateGameInfoViewController *vc = [[(UINavigationController *)[segue destinationViewController] viewControllers] objectAtIndex:0];
        
        [vc setDelegate:self];
    }
}



@end
