//
//  UIImage+CL.m
//  test7
//
//  Created by canglong on 2025/6/9.
//

#import "UIImage+CL.h"

@implementation UIImage(CL)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end

