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

        if ([dictionary objectForKey:kOriginal_size] && dictionary[kOriginal_size] != [NSNull null]) {
            
            NSDictionary *originalSize = dictionary[kOriginal_size];
            
            if ([originalSize objectForKey:kUrl] && originalSize[kUrl] != [NSNull null]) {
                self.photoURL = [originalSize valueForKey:kUrl];
            }
            if ([originalSize objectForKey:kHeight] && originalSize[kHeight] != [NSNull null]) {
                self.photoHeight = [originalSize valueForKey:kHeight];
            }
            if ([originalSize objectForKey:kWidth] && originalSize[kWidth] != [NSNull null]) {
                self.photoWidth = [originalSize valueForKey:kWidth];
            }
        }
    }
    return self;
}

- (void)downloadPhotoWithCompletionBlock:(void(^)(BOOL success))completionBlock {
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]
                                      dataTaskWithURL:[NSURL URLWithString:self.photoURL]
                                      completionHandler:^(NSData *data, NSURLResponse *response,
                                                          NSError *error) {
                                          NSHTTPURLResponse *httpResponse = ((NSHTTPURLResponse *)response);
                                          if (error) {
                                              NSLog(@"error.description - %@", error.description);
                                          } else if (httpResponse.statusCode != 200) {
                                              NSLog(@"error.description - %@", error.description);
                                          } else {
                                              
                                              UIImage *image = [UIImage imageWithData:data];
                                              if (image) {
                                                  self.photoImage = image;
                                                  completionBlock(YES);
                                              } else {
                                                  completionBlock(NO);
                                              }
                                          }
                                      }];
    
    [dataTask resume];
    
}

@end
