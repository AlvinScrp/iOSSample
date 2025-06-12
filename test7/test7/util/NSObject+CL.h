//
//  NSObject+CL.h
//  test7
//
//  Created by canglong on 2025/6/6.
//


#import <Foundation/Foundation.h>

@interface NSObject (CL)

/// 字符串值
- (NSString *)stringValue;

#pragma mark - 判空

/// 是否为空对象
- (BOOL)isNotNullOrEmpty;

/// 是否是NSString
- (BOOL)isNSStringAndNotEmpty;

/// 是否是NSDictionary
- (BOOL)isNSDictionaryAndNotEmpty;

/// 是否是NSArray
- (BOOL)isNSArrayAndNotEmpty;

#pragma mark - Swizzle

/// 交换类方法
+ (void)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector;

/// 交换实例方法
- (void)swizzleInstanceMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
