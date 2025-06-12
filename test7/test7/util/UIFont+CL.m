//
//  UIFont+CL.m
//  test7
//
//  Created by canglong on 2025/6/12.
//

#import "UIFont+CL.h"

@implementation UIFont(CL)



+ (UIFont *)impactFontWithSize:(CGFloat)size {
    NSString *fontName = @"Impact";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)pingFangSCRegularFontWithSize:(CGFloat)size {
    NSString *fontName = @"PingFangSC-Regular";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)pingFangSCMediumFontWithSize:(CGFloat)size {
    NSString *fontName = @"PingFangSC-Medium";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)pingFangSCLightFontWithSize:(CGFloat)size {
    NSString *fontName = @"PingFangSC-Light";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)pingFangSCSemiboldFontWithSize:(CGFloat)size {
    NSString *fontName = @"PingFangSC-Semibold";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)pingFangSCThinFontWithSize:(CGFloat)size {
    NSString *fontName = @"PingFangSC-Thin";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)dinMediumFontWithSize:(CGFloat)size {
    NSString *fontName = @"DIN-Medium";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)dinBoldFontWithSize:(CGFloat)size {
    NSString *fontName = @"DIN-Bold";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)dinRegularFontWithSize:(CGFloat)size {
    NSString *fontName = @"DIN-Regular";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)dinBlackFontWithSize:(CGFloat)size {
    NSString *fontName = @"DIN-Black";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)dinCondBoldFontWithSize:(CGFloat)size {
    NSString *fontName = @"DINCond-Bold";
    return [self jlbiz_fontWithName:fontName size:size];
}

+ (UIFont *)lcdDFontWithSize:(CGFloat)size {
    NSString *fontName = @"LcdD";
    return [self jlbiz_fontWithName:fontName size:size];
}



+ (UIFont *)jlbiz_fontWithName:(NSString *)fontName size:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:fontName size:size];
    return font ?: [UIFont systemFontOfSize:size];
}

@end
