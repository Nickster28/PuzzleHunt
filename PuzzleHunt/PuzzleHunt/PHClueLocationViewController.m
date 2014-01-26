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
@property (nonatomic, strong) PHMapPoint *currPoint;
@end

@implementation PHClueLocationViewController


//@property (nonatomic, weak) IBOutlet MKMapView *mapView;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    // Get the text from the text view...
    NSString *placeName = [textField text];
    
    // Create a search request with the text
    MKLocalSearchRequest *searchRequest = [[MKLocalSearchRequest alloc] init];
    [searchRequest setNaturalLanguageQuery: placeName];
    [searchRequest setRegion:MKCoordinateRegionMakeWithDistance([[[PHGameStore sharedStore] currLocation] coordinate], 100000, 100000)];
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:searchRequest];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        if (!error) {
            // Get the first map item and pull its coordinates
            MKMapItem *loc = [[response mapItems] objectAtIndex:0];
            [self setLatitude:[NSNumber numberWithDouble:loc.placemark.coordinate.latitude]];
            [self setLongitude:[NSNumber numberWithDouble:loc.placemark.coordinate.longitude]];
            
            // Remove the old pin and add a new pin
            PHMapPoint *point = [[PHMapPoint alloc] initWithLatitude:[self latitude] Longitude:[self longitude] Team:@""];
            [[self mapView] removeAnnotation:self.currPoint];
            [[self mapView] addAnnotation:point];
            [self setCurrPoint:point];
            
            // Zoom in on the pin
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc.placemark.coordinate,1000,1000);
            [[self mapView] setRegion:region animated:YES];
        }
    }];
    
    return YES;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.delegate userChoseLocationWithLat:self.latitude
                                  longitude:self.longitude];
}




@end
