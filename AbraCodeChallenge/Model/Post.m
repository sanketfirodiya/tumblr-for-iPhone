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
        self.caption = dictionary[kCaption];
        self.timeStamp = dictionary[kTimestamp];
        self.tags = dictionary[kTags];
        self.photo = [[Photo alloc] initWithDictionary:[dictionary[kPhotos] objectAtIndex:0]];
    }
    return self;
}

@end
