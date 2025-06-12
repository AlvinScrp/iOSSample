//
//  UIImageView+CL.m
//  test7
//
//  Created by canglong on 2025/6/5.
//

#import "UIImageView+CL.h"
#import "SDWebImage/SDWebImage.h"

@implementation UIImageView(CL)

-(void) loadCdnUrl:(NSString *)cdnUrl{
    [self sd_setImageWithURL:[NSURL URLWithString:cdnUrl]];
}

@end
