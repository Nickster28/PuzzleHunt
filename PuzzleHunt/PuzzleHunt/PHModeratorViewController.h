//
//  PHModeratorViewController.h
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/26/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PHGame.h"

@interface PHModeratorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *rankingTableView;
@property (nonatomic, weak) IBOutlet MKMapView *rankingMapView;
@property (nonatomic, strong) PHGame *currGame;
@end
