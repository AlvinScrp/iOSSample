//
//  NSString+CL.m
//  test7
//
//  Created by canglong on 2025/6/5.
//

#import "NSString+CL.h"

extern NSString *JLBIZ_CDN_HOST(void){
    return  @"cdn.webuy.ai";
}

@implementation NSString (CL)
- (NSString *)cdnString{
    NSString *path = self.lowercaseString;
    if (path.length == 0) return self;
    if ([path hasPrefix:@"http://"] || [path hasPrefix:@"https://"]) return self;
    
    if (![path hasPrefix:@"/"]) {
        return [NSString stringWithFormat:@"https://%@/%@", JLBIZ_CDN_HOST(), self];
    } else {
        return [NSString stringWithFormat:@"https://%@%@", JLBIZ_CDN_HOST(), self];
    }
}
- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}
@end
