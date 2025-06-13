//
//  UICollectionViewCell+Click.m
//  test7
//
//  Created by canglong on 2025/6/12.
//

#import "UIView+Click.h"
#import "UIKit/UIKit.h"
#import <objc/runtime.h>  // 必须导入这个头文件

@implementation UIView (ClickBlock)

- (void)addClickAction: (void (^)(void))block {
    self.clickBlock = block;
    if (![self.gestureRecognizers containsObject:self.tapGesture]) {
        [self addGestureRecognizer:self.tapGesture];
    }
   
}

- (UITapGestureRecognizer *)tapGesture {
    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, _cmd);
    if (!tap) {
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
        objc_setAssociatedObject(self, _cmd, tap, OBJC_ASSOCIATION_RETAIN);
    }
    return tap;
}

- (void)handleTap {
    self.clickBlock();
//    !self.clickBlock ?: self.clickBlock();
}

- (void (^)(void))clickBlock {
    return objc_getAssociatedObject(self, @selector(clickBlock));
}

- (void)setClickBlock:(void (^)(void))clickBlock {
    objc_setAssociatedObject(self, @selector(clickBlock), clickBlock, OBJC_ASSOCIATION_COPY);
}

@end
