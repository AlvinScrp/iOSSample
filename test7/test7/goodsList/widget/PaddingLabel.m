//
//  PaddingLabel.m
//  test7
//
//  Created by canglong on 2025/6/6.
//

#import "PaddingLabel.h"

@implementation PaddingLabel

// 重写绘制方法，调整文字绘制区域
- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textPadding)];
}

// 调整 intrinsicContentSize（自动布局时计算正确大小）
- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    return CGSizeMake(
        size.width + self.textPadding.left + self.textPadding.right,
        size.height + self.textPadding.top + self.textPadding.bottom
    );
}

// 调整 sizeThatFits（手动计算大小时生效）
- (CGSize)sizeThatFits:(CGSize)size {
    CGSize adjustedSize = [super sizeThatFits:CGSizeMake(
        size.width - self.textPadding.left - self.textPadding.right,
        size.height - self.textPadding.top - self.textPadding.bottom
    )];
    return CGSizeMake(
        adjustedSize.width + self.textPadding.left + self.textPadding.right,
        adjustedSize.height + self.textPadding.top + self.textPadding.bottom
    );
}
@end
