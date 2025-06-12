//
//  HttpResponseBean.m
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import "JLHttpResponseModel.h"
#import  <YYModel/YYModel.h>
//@interface HttpResponseBean()
//@property (nonatomic, strong) Class resultClass;
//@end

@implementation JLHttpResponseModel{
    Class _resultClass; // 存储运行时类型
}

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        NSNumber *count = [dict objectForKey:@"count"];
        if ([count isKindOfClass:[NSNumber class]]) {
            _count = [count intValue];
        }else{
            _count = 0;
        }
        
        NSNumber *status = [dict objectForKey:@"status"];
        if ([status isKindOfClass:[NSNumber class]]) {
            _status = [status boolValue];
        }else{
            _status = 0;
        }
        
        NSNumber *hasNext = [dict objectForKey:@"hasNext"];
        if ([hasNext isKindOfClass:[NSNumber class]]) {
            _hasNext = [hasNext boolValue];
        }else{
            _hasNext = YES;
        }
        
        NSNumber *responseCode = [dict objectForKey:@"responseCode"];
        if ([responseCode isKindOfClass:[NSNumber class]]) {
            _responseCode = [responseCode integerValue];
        }else{
            _responseCode = 0;
        }
        
        NSString *message = [dict objectForKey:@"message"];
        if ([message isKindOfClass:[NSString class]]) {
            _message = message;
        }else{
            _message = @"";
        }
        
        _entry = [dict objectForKey:@"entry"];
    }
    return self;
}

- (nullable instancetype)initWithEntry:(id)entry {
    if (self = [super init]) {
        _count = 0;
        _status = YES;
        _hasNext = YES;
        _responseCode = 0;
        _message = @"";
        _entry = entry;
    }
    return self;
}
@end

