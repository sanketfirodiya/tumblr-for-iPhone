//
//  Photo.m
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import "Photo.h"
#import "GlobalConstants.h"

@implementation Photo


- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        NSLog(@"dictionary[kPhotos] class - %@", [dictionary valueForKey:kOriginal_size]);
        self.photoURL = [[dictionary valueForKey:kOriginal_size] valueForKey:kUrl];
        self.photoHeight = [[dictionary valueForKey:kOriginal_size] valueForKey:kHeight];
        self.photoWidth = [[dictionary valueForKey:kOriginal_size] valueForKey:kWidth];
    }
    return self;
}

@end
