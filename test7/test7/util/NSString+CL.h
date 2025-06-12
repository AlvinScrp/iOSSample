//
//  NSString+CL.h
//  test7
//
//  Created by canglong on 2025/6/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString *JLBIZ_CDN_HOST(void);

@interface NSString (CL)
- (NSString *)cdnString;
- (NSString *)stringByTrim;
@end

NS_ASSUME_NONNULL_END
