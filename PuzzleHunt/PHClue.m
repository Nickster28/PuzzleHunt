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
             //Image:(UIImage *)image
          Latitude:(NSNumber *)latitude
         Longitude:(NSNumber *)longitude
              Time:(NSUInteger)time
             Hints:(NSArray *)hints {
    self = [super init];
    if(self) {
        [self setClueName:name];
        [self setClueDescription:description];
        //[self setClueImage:image];
        [self setLatitude:latitude];
        [self setLongitude:longitude];
        [self setTime:time];
        [self setHints:hints];
    }
    return self;
}

- (id)init {
    return [self initWithName:@"" Description:@"" Latitude:@0 Longitude:@0 Time:0 Hints:@[]];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        [self setClueName:[aDecoder decodeObjectForKey:@"clueName"]];
        [self setClueDescription:[aDecoder decodeObjectForKey:@"clueDescription"]];
        [self setLatitude:[aDecoder decodeObjectForKey:@"latitude"]];
        [self setLongitude:[aDecoder decodeObjectForKey:@"longitude"]];
        [self setTime:[aDecoder decodeIntegerForKey:@"time"]];
        [self setHints:[aDecoder decodeObjectForKey:@"hints"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_clueName forKey:@"clueName"];
    [aCoder encodeObject:_clueDescription forKey:@"clueDescription"];
    [aCoder encodeObject:_latitude forKey:@"latitude"];
    [aCoder encodeObject:_longitude forKey:@"longitude"];
    [aCoder encodeObject:_hints forKey:@"hints"];
}

@end
