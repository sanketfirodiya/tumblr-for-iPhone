//
//  PostsHelper.m
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import "PostsHelper.h"

@implementation PostsHelper

+ (NSArray *)buildPostsFromDictionary:(NSDictionary *)dictionary {
    
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    
    if ([dictionary objectForKey:@"posts"]) {
        NSArray *postsArray = [dictionary valueForKey:@"posts"];
        
        for (id postDictionary in postsArray) {
            Post *post = [[Post alloc] initWithDictionary:postDictionary];
            [posts addObject:post];
        }
    }
    
    return posts;
}

@end
