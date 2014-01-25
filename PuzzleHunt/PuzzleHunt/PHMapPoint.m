//
//  PHMapPoint.m
//  PuzzleHunt
//
//  Created by Kristen Pownell on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHMapPoint.h"


@implementation PHMapPoint

- (id)initWithLatitude:(NSNumber *)latitude Longitude:(NSNumber *)longitude Team:(NSString *)team {
    self = [super init];
    if(self) {
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(latitude.doubleValue, longitude.doubleValue);
        [self setCoordinate:coord];
        [self setTitle:team];
    }
    return self;
}

- (id)init {
    return [self initWithLatitude:@0 Longitude:@0 Team:@"0"];
}

@end
