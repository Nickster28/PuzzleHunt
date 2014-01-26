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
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:searchRequest];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        MKMapItem *loc = [[response mapItems] objectAtIndex:0];
        [self setLatitude:[NSNumber numberWithDouble:loc.placemark.coordinate.latitude]];
        [self setLongitude:[NSNumber numberWithDouble:loc.placemark.coordinate.longitude]];
        
        PHMapPoint *point = [[PHMapPoint alloc] initWithLatitude:[self latitude] Longitude:[self longitude] Team:@""];
        [[self mapView] addAnnotation:point];
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc.placemark.coordinate,100,100);
        [[self mapView] setRegion:region animated:YES];
    }];
    
    return YES;
}




@end
