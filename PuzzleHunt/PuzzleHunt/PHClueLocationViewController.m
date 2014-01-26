//
//  PHClueLocationViewController.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/26/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHClueLocationViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PHMapPoint.h"
#import "PHGameStore.h"

@interface PHClueLocationViewController ()

@end

@implementation PHClueLocationViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


//@property (nonatomic, weak) IBOutlet MKMapView *mapView;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    // Get the text from the text view...
    NSString *placeName = [textField text];
    
    MKLocalSearchRequest *searchRequest = [[MKLocalSearchRequest alloc] init];
    [searchRequest setNaturalLanguageQuery: placeName];
    [searchRequest setRegion:MKCoordinateRegionMakeWithDistance([[[PHGameStore sharedStore] currLocation] coordinate], 100000, 100000)];
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:searchRequest];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        if (!error) {
            MKMapItem *loc = [[response mapItems] objectAtIndex:0];
            [self setLatitude:[NSNumber numberWithDouble:loc.placemark.coordinate.latitude]];
            [self setLongitude:[NSNumber numberWithDouble:loc.placemark.coordinate.longitude]];
            
            PHMapPoint *point = [[PHMapPoint alloc] initWithLatitude:[self latitude] Longitude:[self longitude] Team:@""];
            [[self mapView] addAnnotation:point];
            
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc.placemark.coordinate,1000,1000);
            [[self mapView] setRegion:region animated:YES];
        }
    }];
    
    return YES;
}




@end
