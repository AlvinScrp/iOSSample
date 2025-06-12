//
//  NSNumber+CL.m
//  test7
//
//  Created by canglong on 2025/6/9.
//

#import "NSNumber+CL.h"

@implementation NSNumber(CL)

-(NSString *) formatMoney{
    long long fenAmount = self.longLongValue;
    // 分转元（浮点数计算）
    double yuanAmount = fenAmount / 100.0;
    
    // 判断是否有小数部分
    if (fenAmount % 100 == 0) {
        // 整数元，不带小数
        return [NSString stringWithFormat:@"%ld", (long)(yuanAmount)];
    } else {
        // 带两位小数
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumFractionDigits = 2;
        formatter.maximumFractionDigits = 2;
        return [formatter stringFromNumber:@(yuanAmount)];
    }
}

@end
