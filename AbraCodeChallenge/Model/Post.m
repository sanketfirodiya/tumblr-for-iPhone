//
//  Post.m
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import "Post.h"
#import "GlobalConstants.h"

@implementation Post

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        
        if ([dictionary objectForKey:kCaption] && dictionary[kCaption] != [NSNull null]) {
            self.caption = dictionary[kCaption];
        }
        if ([dictionary objectForKey:kTimestamp] && dictionary[kTimestamp] != [NSNull null]) {
            self.timeStamp = [NSDate dateWithTimeIntervalSince1970:[[dictionary valueForKey:kTimestamp] doubleValue]];
        }
        if ([dictionary objectForKey:kTags] && dictionary[kTags] != [NSNull null]) {
            self.tags = dictionary[kTags];
        }
        if ([dictionary objectForKey:kPhotos] && dictionary[kPhotos] != [NSNull null]) {
            self.photo = [[Photo alloc] initWithDictionary:[dictionary[kPhotos] objectAtIndex:0]];
        } else {
            return nil;
        }
    }
    return self;
}

@end
