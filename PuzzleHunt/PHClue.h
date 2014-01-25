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
@property (nonatomic) NSUInteger latitude;
@property (nonatomic) NSUInteger longitude;
@property (nonatomic) NSUInteger time;              //Units in minutes
@property (nonatomic,strong) NSArray *hints;

- (id)initWithName:(NSString *)name
       Description:(NSString *)description
             //Image:(UIImage *)image
          Latitude:(NSUInteger)latitude
         Longitude:(NSUInteger)longitude
              Time:(NSUInteger)time
             Hints:(NSArray *)hints;

@end
