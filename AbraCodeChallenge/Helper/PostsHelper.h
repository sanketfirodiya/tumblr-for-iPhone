//
//  PostsHelper.h
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface PostsHelper : NSObject

+ (NSArray *)buildPostsFromDictionary:(NSDictionary *)dictionary;

@end
