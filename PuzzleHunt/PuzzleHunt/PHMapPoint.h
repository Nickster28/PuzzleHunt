//
//  PHMapPoint.h
//  PuzzleHunt
//
//  Created by Kristen Pownell on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface PHMapPoint : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

- (id)initWithLatitude:(NSNumber *)latitude Longitude:(NSNumber *)longitude Team:(NSString *)team;

@end
