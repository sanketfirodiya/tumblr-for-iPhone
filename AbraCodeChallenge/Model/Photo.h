//
//  Photo.h
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *photoURL;
@property (nonatomic, strong) NSNumber *photoHeight;
@property (nonatomic, strong) NSNumber *photoWidth;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
