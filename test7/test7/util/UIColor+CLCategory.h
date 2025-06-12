//
//  Common.h
//  test7
//
//  Created by canglong on 2025/6/5.
//

#import <UIKit/UIKit.h>
#import "NSString+CL.h"

extern UIColor *UIColorFromRGB(uint32_t rgbValue);
extern UIColor *UIColorFromRGBA(uint32_t rgbValue);
extern UIColor *UIColorFromRGB_alpha(uint32_t rgbValue, CGFloat alphaValue);
extern UIColor *UIColorWithARGB(uint32_t argbValue);

@interface UIColor (CLCategory)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
+ ( UIColor * _Nullable)colorWithHexString:(NSString *)hexStr;

/// 根据图片获取主颜色
/// @param image 初始图片
+ (UIColor*)mostColor:(UIImage*)image;


@end

