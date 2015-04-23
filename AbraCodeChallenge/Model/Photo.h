//
//  Photo.h
//  AbraCodeChallenge
//
//  Created by Firodiya, Sanket on 4/22/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *photoURL;
@property (nonatomic, strong) NSNumber *photoHeight;
@property (nonatomic, strong) NSNumber *photoWidth;
@property (nonatomic, strong) UIImage *photoImage;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
- (void)downloadPhotoWithCompletionBlock:(void(^)(BOOL success))completionBlock;

@end
