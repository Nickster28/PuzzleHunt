//
//  PHGameStore.m
//  PuzzleHunt
//
//  Created by Nick Troccoli on 1/25/14.
//  Copyright (c) 2014 Trancos. All rights reserved.
//

#import "PHGameStore.h"

@implementation PHGameStore


+ (PHGameStore *)sharedStore
{
    static PHGameStore *sharedStore;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[PHGameStore alloc] init];
    });
    
    return sharedStore;
}

@end
