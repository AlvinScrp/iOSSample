//
//  JLSearchResultPitemModel.m
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import "JLSearchResultPitemModel.h"
//#import "JLSearchResultPitemLabelModel.h"

@implementation JLSearchResultPitemModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"labelList":JLSearchResultPitemLabelModel.class,
    };
}

@end
