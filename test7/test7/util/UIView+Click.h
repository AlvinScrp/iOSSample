//
//  UICollectionViewCell+Click.h
//  test7
//
//  Created by canglong on 2025/6/12.
//

#import <UIKit/UIKit.h>

@interface UIView (ClickBlock)
@property (nonatomic, copy) void(^clickBlock)(void);
- (void)addClickAction:(void(^)(void))block;
@end
