//
//  NSDateFormatterStringLongStyle.h
//  
//
//  Created by Firodiya, Sanket on 9/15/13.
//
//

#import <Foundation/Foundation.h>

@interface NSDateFormatterStringLongStyle : NSDateFormatter
@property (strong, nonatomic) NSDateFormatter *NSDateFormatter;

#pragma mark -
#pragma mark Shared Manager
+ (NSDateFormatterStringLongStyle *)sharedNSDateFormatterStringLongStyle;
@end
