//
//  PHClue.h
//  PuzzleHunt
//
//  Created by Kristen Pownell on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHClue : NSObject <NSCoding>

@property (nonatomic,strong) NSString *clueName;
@property (nonatomic,strong) NSString *clueDescription;
//@property (nonatomic,strong) UIImage *clueImage;
@property (nonatomic,strong) NSNumber *latitude;
@property (nonatomic,strong) NSNumber *longitude;
@property (nonatomic) NSUInteger time;              //Units in minutes
@property (nonatomic,strong) NSArray *hints;

- (id)initWithName:(NSString *)name
       Description:(NSString *)description
             //Image:(UIImage *)image
          Latitude:(NSNumber *)latitude
         Longitude:(NSNumber *)longitude
              Time:(NSUInteger)time
             Hints:(NSArray *)hints;

@end
