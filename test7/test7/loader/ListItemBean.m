//
//  ListItemBean.m
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import "ListItemBean.h"

@implementation ListItemBean

@end

@implementation ListResultBean
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [ListItemBean class] };
}

@end
