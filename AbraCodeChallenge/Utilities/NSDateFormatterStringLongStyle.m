//
//  NSDateFormatterStringLongStyle.m
//  
//
//  Created by Firodiya, Sanket on 9/15/13.
//
//

#import "NSDateFormatterStringLongStyle.h"

@implementation NSDateFormatterStringLongStyle

+ (NSDateFormatterStringLongStyle *)sharedNSDateFormatterStringLongStyle{
    static NSDateFormatterStringLongStyle *_sharedNSDateFormatterStringLongStyle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNSDateFormatterStringLongStyle = [[self alloc] init];
    });
    
    return _sharedNSDateFormatterStringLongStyle;
}

#pragma mark -
#pragma mark Private Initialization
- (id)init{
    self = [super init];
    if (self) {
        self.NSDateFormatter = [[NSDateFormatter alloc] init];
        // date style --> December 30, 2013
        [self.NSDateFormatter setDateStyle:NSDateFormatterLongStyle];
    }
    return self;
}



@end
