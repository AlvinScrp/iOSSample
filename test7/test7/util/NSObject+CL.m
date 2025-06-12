//
//  NSObject+CL.m
//  test7
//
//  Created by canglong on 2025/6/6.
//

#import "NSObject+CL.h"

#import <objc/runtime.h>

@implementation NSObject (CL)

- (NSString *)stringValue {
    return [NSString stringWithFormat:@"%@", self];
}

#pragma mark - 判空

- (BOOL)isNotNullOrEmpty {
    if ([NSNull null] == self || nil == self) {
        return NO;
    }
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString*)self;
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (str.length > 0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return YES;
    }
}

- (BOOL)isNSStringAndNotEmpty {
    if ([NSNull null] == self || nil == self) {
        return NO;
    }
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString*)self;
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (str.length > 0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (BOOL)isNSDictionaryAndNotEmpty {
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *temp = (NSDictionary *)self;
        if (temp.allKeys.count > 0) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isNSArrayAndNotEmpty {
    if ([self isKindOfClass:[NSArray class]]) {
        NSArray *temp = (NSArray *)self;
        if (temp.count > 0) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Swizzle

+ (void)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector {
    Class cls = [self class];
    Method originalMethod = class_getClassMethod(cls, origSelector);
    Method swizzledMethod = class_getClassMethod(cls, newSelector);
    
    Class metacls = objc_getMetaClass(object_getClassName(cls));
    BOOL didAddMethod = class_addMethod(metacls, origSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(metacls, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)swizzleInstanceMethod:(SEL)origSelector withMethod:(SEL)newSelector {
    Class cls = [self class];
    Method originalMethod = class_getInstanceMethod(cls, origSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, newSelector);
    
    BOOL didAddMethod = class_addMethod(cls, origSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

