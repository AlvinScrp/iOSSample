//
//  UIFont+CL.h
//  test7
//
//  Created by canglong on 2025/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont(CL) 
+ (UIFont *)impactFontWithSize:(CGFloat)size;

/// 苹方字体
+ (UIFont *)pingFangSCRegularFontWithSize:(CGFloat)size;
+ (UIFont *)pingFangSCMediumFontWithSize:(CGFloat)size;
+ (UIFont *)pingFangSCLightFontWithSize:(CGFloat)size;
+ (UIFont *)pingFangSCSemiboldFontWithSize:(CGFloat)size;
+ (UIFont *)pingFangSCThinFontWithSize:(CGFloat)size;

/// 数字字体
+ (UIFont *)dinBoldFontWithSize:(CGFloat)size;
+ (UIFont *)dinMediumFontWithSize:(CGFloat)size;
+ (UIFont *)dinRegularFontWithSize:(CGFloat)size;
+ (UIFont *)dinBlackFontWithSize:(CGFloat)size;
+ (UIFont *)dinCondBoldFontWithSize:(CGFloat)size;

+ (UIFont *)lcdDFontWithSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
