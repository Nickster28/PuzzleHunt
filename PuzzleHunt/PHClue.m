//
//  PHClue.m
//  PuzzleHunt
//
//  Created by Kristen Pownell on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHClue.h"

@implementation PHClue

- (id)initWithName:(NSString *)name
       Description:(NSString *)description
             Image:(UIImage *)image
          Latitude:(NSUInteger)latitude
         Longitude:(NSUInteger)longitude
              Time:(NSUInteger)time
             Hints:(NSArray *)hints {
    self = [super init];
    if(self) {
        [self setClueName:name];
        [self setClueDescription:description];
        [self setClueImage:image];
        [self setLatitude:latitude];
        [self setLongitude:longitude];
        [self setTime:time];
        [self setHints:hints];
    }
    return self;
}

- (id)init {
    return [self initWithName:@"" Description:@"" Image:Nil Latitude:0 Longitude:0 Time:0 Hints:@[]];
}

@end
