//
//  Post.h
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) NSMutableArray *tags;

@end
